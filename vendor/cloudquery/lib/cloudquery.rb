require "rubygems"
require "uri"
require "digest/sha1"
require "base64"
require "rack/utils"
require "curl"
require "json"

module Cloudquery
  SCHEME = "https".freeze
  HOST = "api.xoopit.com".freeze
  PATH = "/v0".freeze

  API_PATHS = {
    :account => "account".freeze,
    :schema => "schema".freeze,
    :indexes => "i".freeze,
    :documents => "i".freeze,
  }.freeze

  # Standard Content-Types for requests
  CONTENT_TYPES = {
    :json => 'application/json;charset=utf-8'.freeze,
    :form => 'application/x-www-form-urlencoded'.freeze,
    :xml  => 'application/xml;charset=utf-8'.freeze,
  }.freeze


  SIGNING_METHOD = "SHA1".freeze
  COOKIE_JAR = (ENV["COOKIE_JAR"] || ".cookies.lwp").freeze

  class Request
    attr_accessor :method, :headers, :scheme, :host, :port, :path, :params, :body

    def initialize(options={})
      @method = options[:method] || 'POST'
      @headers = options[:headers] || {}
      @scheme = options[:scheme] || SCHEME
      @host = options[:host] || HOST
      @port = options[:port] || (@scheme == 'https' ? URI::HTTPS::DEFAULT_PORT : URI::HTTP::DEFAULT_PORT)
      @path = options[:path] || PATH
      @params = options[:params] || {}
      if ['PUT', 'DELETE'].include?(@method)
        @params['_method'] = @method
        @method = 'POST'
      end
      @body = options[:body]

      @account = options[:account]
      @secret = options[:secret]
    end

    def request_uri(account=@account, secret=@secret)
      query = query_str(signature_params(account))
      uri = if query.empty?
        @path.dup
      else
        "#{@path}?#{query}"
      end
      uri = append_signature(uri, secret) if secret
      uri
    end

    def url(account=@account, secret=@secret)
      base_uri.merge(request_uri(account, secret)).to_s
    end

    private
    def append_signature(uri, secret)
      sig = Crypto::URLSafeSHA1.sign(secret, uri)
      x_sig = Rack::Utils.build_query("x_sig" => sig)
      "#{uri}&#{x_sig}"
    end

    def signature_params(account=@account)
      return {} unless account
      {
        'x_name' => account,
        'x_time' => Time.now.to_i_with_milliseconds,
        'x_nonce' => Cloudquery::Crypto::Random.nonce,
        'x_method' => SIGNING_METHOD,
      }
    end

    def query_str(additional_params={})
      Rack::Utils.build_query(@params.dup.merge(additional_params))
    end

    def base_uri
      uri_class = (@scheme == 'https' ? URI::HTTPS : URI::HTTP)
      uri_class.build(:scheme => @scheme, :host => @host, :port => @port)
    end

  end

  module Crypto
    module Random
      extend self

      SecureRandom = (defined?(::SecureRandom) && ::SecureRandom) || (defined?(::ActiveSupport::SecureRandom) && ::ActiveSupport::SecureRandom)
      if SecureRandom
        def nonce
          "#{SecureRandom.random_number}.#{Time.now.to_i}"[2..-1]
        end
      else
        def nonce
          "#{rand.to_s}.#{Time.now.to_i}"[2..-1]
        end
      end

    end

    module URLSafeSHA1
      extend self

      def sign(*tokens)
        tokens = tokens.flatten
        digest = Digest::SHA1.digest(tokens.join)
        Base64.encode64(digest).chomp.tr('+/', '-_')
      end

    end
  end

  class Client
    attr_reader :account
    attr_writer :secret

    # Create a new instance of the client
    #
    # It's highly recommended to set options <tt>:account</tt>
    # and <tt>:secret</tt>. Creating a client without an account
    # and secret isn't very useful.
    #
    # ==== Acceptable options:
    #   :account => <account name> (default => nil)
    #   :secret => <API secret> (default => nil)
    #   :document_id_method => <method name> (default => nil)
    #   :secure => Boolean (use HTTPS, default => true)
    #
    # If +document_id_method+ is set, it will be called on each
    # document as a part of +add_documents+ and +update_documents+
    # which should inject an <tt>'#.id'</tt> key-value pair as a
    # simple way to tie app PKs to doc ids.
    def initialize(options={})
      # unless options[:account] && options[:secret]
      #   raise "Client requires :account => <account name> and :secret => <secret>"
      # end

      @account = options[:account]
      @secret = options[:secret]

      @secure = options[:secure] != false # must pass false for insecure

      @document_id_method = options[:document_id_method]
    end


    ## Account management

    # Retrieve the API secret for an +account+, using the +password+ (uses HTTPS)
    def self.get_secret(account, password)
      auth = Request.new(:path => "#{PATH}/auth")
      curl = Curl::Easy.new(auth.url) do |c|
        c.enable_cookies = true
        c.cookiejar = COOKIE_JAR
      end
      params = Rack::Utils.build_query({"name" => account, "password" => password})
      curl.http_post(params)

      if curl.response_code == 200
        curl.url = Request.new(:path => "#{PATH}/#{API_PATHS[:account]}/#{account}").url
        curl.http_get
        response = JSON.parse(curl.body_str)
        response['result']['secret']
      else
        STDERR.puts "Error: #{curl.response_code} #{Rack::Utils::HTTP_STATUS_CODES[curl.response_code]}"
      end
    end

    # Get the account document
    def get_account
      send_request get(account_path)
    end

    # Update the account document.
    #
    # Use this method to change the API secret:
    #   update_account({'secret' => 'your-new-secret'})
    def update_account(account_doc={})
      body = JSON.generate(account_doc)
      send_request put(account_path, body)
    end

    # Delete the account.
    #
    # ==== BEWARE: THIS WILL ACTUALLY DELETE YOUR ACCOUNT.
    def delete_account!
      send_request delete(account_path)
    end


    ## Schema management

    # Add a schema to the account. +xml+ can be a +String+
    # or +File+-like (responds to <tt>:read</tt>)
    def add_schema(xml)
      body = xml.respond_to?(:read) ? xml.read : xml
      request = post(build_path(API_PATHS[:schema]), body)
      send_request(request, CONTENT_TYPES[:xml])
    end

    # Delete a schema from the account, by name
    def delete_schema(schema_name)
      send_request delete(build_path(
        API_PATHS[:schema],
        Rack::Utils.escape("xfs.schema.name:\"#{schema_name}\"")
      ))
    end

    # Get the schemas for the account.
    #
    # NOTE: returned format is not the same as accepted for input
    def get_schemas
      send_request get(build_path(API_PATHS[:schema]))
    end


    ## Index management

    # Add one or more indexes to the account, by name or id
    def add_indexes(*indexes)
      body = JSON.generate(indexes.flatten)
      send_request post(build_path(API_PATHS[:indexes]), body)
    end

    # Delete one or more indexes from the account, by name or id
    # <tt>indexes = '*'</tt> will delete all indexes
    def delete_indexes(*indexes)
      indexes = url_pipe_join(indexes)
      send_request delete(build_path(API_PATHS[:indexes], indexes))
    end

    # Get the indexes from the account. Returns a list of ids
    def get_indexes
      send_request get(build_path(API_PATHS[:indexes]))
    end


    ## Document management

    # Add documents to the specified +index+
    #
    # <tt>index = name</tt> or +id+, <tt>docs = {}</tt> or +Array+ of <tt>{}</tt>.
    #
    # Documents with key <tt>'#.id'</tt> and an existing value will be updated.
    #
    # If +schemas+ is not +nil+, ensures existence of the
    # specified schemas on each document.
    def add_documents(index, docs, *schemas)
      request = post(
        build_path(API_PATHS[:documents], index, url_pipe_join(schemas)),
        JSON.generate(identify_documents(docs))
      )
      send_request request
    end

    # Update documents in the specified +index+

    # <tt>index = name</tt> or +id+, <tt>docs = {}</tt> or +Array+ of <tt>{}</tt>.
    #
    # Documents lacking the key <tt>'#.id'</tt> will be created.
    #
    # If +schemas+ is not +nil+, ensures existence of the
    # specified schemas on each document.
    def update_documents(index, docs, *schemas)
      request = put(
        build_path(API_PATHS[:documents], index, url_pipe_join(schemas)),
        JSON.generate(identify_documents(docs))
      )
      send_request request
    end

    # Modify documents in the +index+ matching +query+
    #
    # <tt>modifications = {...data...}</tt> to update all matching
    # documents.
    #
    # If +schemas+ is not +nil+, ensures existence of the
    # specified schemas on each document.
    def modify_documents(index, query, modifications, *schemas)
      request = put(
        build_path(API_PATHS[:documents], index, url_pipe_join(schemas), Rack::Utils.escape(query)),
        JSON.generate(modifications)
      )
      send_request request
    end

    # Delete documents in the +index+ matching +query+
    #
    #   query => defaults to '*'
    #   index => may be an id, index name, or Array of ids or names.
    #
    # Operates on all indexes if +index+ = +nil+ or <tt>'*'</tt>
    #
    # ==== BEWARE: If +query+ = +nil+ this will delete ALL documents in +index+.
    #
    # If +schemas+ is not +nil+, ensures existence of the
    # specified schemas on each document.
    def delete_documents(index, query, *schemas)
      request = delete(
        build_path(API_PATHS[:documents],
          url_pipe_join(index),
          url_pipe_join(schemas),
          Rack::Utils.escape(query)
        )
      )
      send_request request
    end

    # Get documents matching +query+
    #
    #   query => defaults to '*'
    #   index => may be an id, index name, or Array of ids or names.
    #
    # Operates on all indexes if +index+ = +nil+ or <tt>'*'</tt>
    #
    # ==== Acceptable options:
    #   :fields => a field name, a prefix match (e.g. 'trans*'), or Array of fields (default => '*')
    #   :sort => a string ("[+|-]schema.field"), or a list thereof (default  => '+#.number')
    #   :offset => integer offset into the result set (default => 0)
    #   :limit => integer limit on number of documents returned per index (default => <no limit>)
    #
    # If +schemas+ is not +nil+, ensures existence of the
    # specified schemas on each document.
    def get_documents(index, query, options={}, *schemas)
      if fields = options.delete(:fields)
        fields = url_pipe_join(fields)
      end

      if options[:sort]
        options[:sort] = Array(options[:sort]).flatten.join(',')
      end

      request = get(
        build_path(API_PATHS[:documents],
          url_pipe_join(index),
          url_pipe_join(schemas),
          url_pipe_join(query),
          fields
        ),
        options
      )
      send_request request
    end

    # Count documents matching +query+
    #
    #   query => defaults to '*'
    #   index => may be an id, index name, or Array of ids or names.
    #
    # Operates on all indexes if +index+ = +nil+ or <tt>'*'</tt>
    #
    # If +schemas+ is not +nil+, ensures existence of the
    # specified schemas on each document.
    def count_documents(index, query, *schemas)
      get_documents(index, query, {:fields => '@count'}, *schemas)
    end

    private
    def build_path(*path_elements)
      path_elements.flatten.compact.unshift(PATH).join('/')
    end

    def account_path
      build_path(API_PATHS[:account], @account)
    end

    def build_request(options={})
      Request.new default_request_params.merge(options)
    end

    def get(path, params={})
      build_request(:method => 'GET', :path => path, :params => params)
    end

    def delete(path, params={})
      build_request(:method => 'DELETE', :path => path, :params => params)
    end

    def post(path, doc, params={})
      build_request(:method => 'POST', :path => path, :body => doc, :params => params)
    end

    def put(path, doc, params={})
      build_request(:method => 'PUT', :path => path, :body => doc, :params => params)
    end

    def default_request_params
      {
        :account => @account,
        :secret => @secret,
        :scheme => @secure ? 'https' : 'http',
      }
    end

    def send_request(request, content_type=nil)
      response = execute_request(request.method, request.url, request.headers, request.body, content_type)
      status_code = response.first
      if (200..299).include?(status_code)
        begin
          result = JSON.parse(response.last)
        rescue JSON::ParserError => e
          result = {"REASON" => e.message}
        end
      else
        result = {"REASON" => "Error: #{status_code} #{Rack::Utils::HTTP_STATUS_CODES[status_code]}"}
      end
      result.merge!({'STATUS' => status_code})
    end

    def execute_request(method, url, headers, body, content_type=nil)
      content_type ||= CONTENT_TYPES[:json]
      curl = Curl::Easy.new(url) do |c|
        c.headers = headers
        c.headers['Content-Type'] = content_type
        c.encoding = 'gzip'
      end
      case method
      when 'GET'
        curl.http_get
      when 'DELETE'
        curl.http_delete
      when 'POST'
        curl.http_post(body)
      when 'PUT'
        curl.http_put(body)
      end

      [curl.response_code, curl.header_str, curl.body_str]
    end

    def url_pipe_join(arr, default_value='*')
      arr = Array(arr).flatten
      if arr.empty?
        default_value
      else
        Rack::Utils.escape(arr.join('|'))
      end
    end

    def identify_documents(docs)
      [docs] if docs.is_a?(Hash)
      if @document_id_method
        docs.each { |d| d.send(@document_id_method) }
      end
      docs
    end
  end
end


class Time
  def to_i_with_milliseconds
    (to_f * 1000).to_i
  end
end
