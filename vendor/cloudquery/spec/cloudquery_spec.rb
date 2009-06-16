require 'spec_helper'

if ENV["TEST_REAL_HTTP"]
  # Create a config.yml file containing the following:
  # :account: <your account name>
  # :secret: <your secret>
  # then run the specs with TEST_REAL_HTTP=true
  describe "CloudQuery account" do
    before(:each) do
      @config = YAML.load(File.read('config.yml'))
      @client = Cloudquery::Client.new(@config)
    end

    it "gets your account information from the server" do
      response = @client.get_account
      response['STATUS'].should be_between(200, 299)
      
      account = response["result"]
      account["secret"].should == @config[:secret]

      account.should have_key("name")
      account["name"].should == @config[:account]

      account.should have_key("preferences")
    end

    it "updates your account on the server" do
      account = @client.get_account["result"]
      response = @client.update_account(account)
      response['STATUS'].should be_between(200, 299)
    end

    it "adds a schema to your account on the server" do
      response = @client.add_schema(File.open('spec/example_schema.xml'))
      response['STATUS'].should be_between(200, 299)
    end

    it "gets the schemas for your account from the server" do
      response = @client.get_schemas
      response['STATUS'].should be_between(200, 299)
      response['result'].should be_an_instance_of(Array)
      response['result'].should have_at_least(1).item
    end

    it "deletes a schema from your account on the server" do
      response = @client.delete_schema("spec.example")
      response['STATUS'].should be_between(200, 299)
    end

    it "adds a single index to your account on the server" do
      response = @client.add_indexes('spec_index')
      response['STATUS'].should be_between(200, 299)
      response['result'].should be_an_instance_of(Array)
      response['result'].should have(1).item
    end

    it "adds multiple indexes to your account on the server" do
      response = @client.add_indexes %w( spec_index_1 spec_index_2 spec_index_3 )
      response['STATUS'].should be_between(200, 299)
      response['result'].should be_an_instance_of(Array)
      response['result'].should have(3).items
    end

    it "gets the indexes for your account from the server" do
      response = @client.get_indexes
      response['STATUS'].should be_between(200, 299)
      response['result'].should be_an_instance_of(Array)
      response['result'].should have_at_least(4).items
    end

    it "deletes a single index from your account on the server" do
      response = @client.delete_indexes('spec_index')
      response['STATUS'].should be_between(200, 299)
      response['result'].should be_an_instance_of(Array)
      response['result'].should have(1).item
    end

    it "deletes multiple indexes from your account on the server" do
      response = @client.delete_indexes %w( spec_index_1 spec_index_2 spec_index_3 )
      response['STATUS'].should be_between(200, 299)
      response['result'].should be_an_instance_of(Array)
      response['result'].should have(3).items
    end

    describe "document support" do
      def valid_document
        {
            'spec.example.name' => 'Steve Rogers',
            'spec.example.email' => ['steve.rogers@example.com','captain.america@marvel.com'],
            'spec.example.telephone' => ['555-555-5555','123-456-6789'],
            'spec.example.address' => ['Lower East Side, NY NY'],
            'spec.example.birthday' => ParseDate.parsedate('July 4, 1917'),
            'spec.example.note' => 'Captain America!',
        }
      end
      
      def add_valid_document(index=nil)
        index ||= 'spec_index'
        response = @client.add_documents(index, valid_document, 'spec.example')
        response['result'].first
      end
      
      before(:each) do
        @client.add_indexes('spec_index')
        @client.add_schema(File.open('spec/example_schema.xml'))
      end

      after(:each) do
        @client.delete_schema("spec.example")
        @client.delete_indexes('spec_index')
      end

      it "adds a document to an index on the server" do
        response = @client.add_documents('spec_index', valid_document, 'spec.example')
        response['STATUS'].should == 201
        response['result'].should have(1).item
      end

      it "adds multiple documents to an index on the server" do
        documents = [
          valid_document,
          {
            'spec.example.name' => 'Clark Kent',
            'spec.example.email' => ['clark.kent@example.com','superman@dc.com'],
            'spec.example.telephone' => ['555-123-1234', '555-456-6789'],
            'spec.example.address' => 
              ['344 Clinton St., Apt. #3B, Metropolis', 'The Fortess of Solitude, North Pole'],
            'spec.example.birthday' => ParseDate.parsedate('June 18, 1938'),
            'spec.example.note' => 
              'Superhuman strength, speed, stamina, durability, senses, intelligence, regeneration, and longevity; super breath, heat vision, x-ray vision and flight. Member of the justice league.',
          },
          {
            'spec.example.name' => 'Bruce Wayne',
            'spec.example.email' => ['bruce.wayne@example.com','batman@dc.com'],
            'spec.example.telephone' => ['555-123-6666', '555-456-6666'],
            'spec.example.address' => 
              ['1007 Mountain Drive, Gotham', 'The Batcave, Gotham'],
            'spec.example.birthday' => ParseDate.parsedate('February 19, 1939'),
            'spec.example.note' => 
              'Sidekick is Robin. Has problems with the Joker. Member of the justice league.',
          },
        ]

        response = @client.add_documents('spec_index', documents, 'spec.example')
        response['STATUS'].should == 201
        response['result'].should have(3).items
      end

      it "updates a document on the server" do
        doc = valid_document
        doc['#.#'] = add_valid_document
        doc['spec.example.note'] = "Document modified!"

        response = @client.update_documents('spec_index', doc, 'spec.example')
        response['STATUS'].should == 200
        response['result'].should have(1).item
      end

      it "modifies documents on the server" do
        add_valid_document
        mods = {'spec.example.note' => 'Document modified!'}
        response = @client.modify_documents(
          "spec_index",
          "name:#{valid_document['spec.example.name']}",
          mods,
          "spec.example"
        )
        response['STATUS'].should == 200 # OK
        response['result'].should have(1).item
      end

      it "gets a document from the server" do
        add_valid_document
        response = @client.get_documents('spec_index', nil, {}, 'spec.example')
        response['STATUS'].should == 200
        response['result'].should have(1).item
        stored_document = response['result'].first
        valid_document.each { |key, value| stored_document.should have_key(key) }
      end
      
      it "gets a document from multiple indexes on the server" do
        @client.add_indexes('spec_index_2')
        @client.delete_documents(nil, nil)
        add_valid_document
        add_valid_document('spec_index_2')

        response = @client.get_documents(nil, nil, {}, 'spec.example')
        response['STATUS'].should == 200
        response['result'].should have(2).items
        stored_document_1 = response['result'].first
        stored_document_2 = response['result'].last

        valid_document.each { |key, value| stored_document_1.should have_key(key) }
        valid_document.each { |key, value| stored_document_2.should have_key(key) }
        
        @client.delete_indexes('spec_index_2')
      end
      
      it "counts documents from the server" do
        @client.delete_documents(nil, nil)
        add_valid_document
        
        response = @client.count_documents('spec_index', '*', 'spec.example')
        response['STATUS'].should == 200
        response['result'].should == 1
      end
    end
  end
end

describe Cloudquery::Client do
  before(:each) do
    @valid_options = {
      :account => 'account',
      :secret => 'secret'
    }
  end
  
  def client(options={})
    return @client if defined?(@client)
    @client = Cloudquery::Client.new(@valid_options.merge(options))
    @client.stub!(:execute_request)
    @client
  end
  
  it "instantiates when passed valid arguments" do
    lambda { client }.should_not raise_error
  end
    
end

describe Cloudquery::Request do
  before(:each) do
    @valid_options = {
      :scheme => 'http',
      :host => 'example.com',
      :path => '/super/duper/path',
    }
  end
  
  def request(additional_options={})
    return @request if defined?(@request)
    @request = Cloudquery::Request.new(@valid_options.merge(additional_options))
  end

  it "instantiates with valid options" do
    lambda { request }.should_not raise_error
  end

  describe "request_uri" do
    describe "without an account or secret" do
      it "appends the query_str to the path after '?'" do
        request.should_receive(:query_str).at_least(:once).and_return("query=string&more=params")
        request.request_uri.should == "#{request.path}?#{request.send(:query_str)}"
      end
      
      it "doesn't append a '?' when query_str is empty" do
        request.should_receive(:query_str).at_least(:once).and_return("")
        request.request_uri.should == request.path
        request.request_uri.should_not equal(request.path) #ensure we don't accidentally modify request's instance variable
      end
    end
    
    describe "with an account" do
      it "should append the signature_params" do
        params = request(:account => 'account').request_uri.sub(/^[^?]+\?/, '').split('&')
        params.select { |n| n.match(/^x_/) }.should have(4).items
      end
      
      describe "and a secret" do
        it "should append the signature when the secret is provided" do
          params = request(:account => 'account', :secret => 'secret').request_uri.sub(/^[^?]+\?/, '').split('&')
          x_params = params.select { |n| n.match(/^x_/) }
          x_params.should have(5).items
          x_params.last.should match(/^x_sig=[0-9a-zA-Z\-._%]+/)
        end
      end
    end
  end
  
  describe "url" do
    it "constructs a full URL from the scheme, host, and request_uri" do
      request.url.should == 
        "#{request.scheme}://#{request.host}#{request.request_uri}"
    end
    
    it "constructs a url using a port override" do
      request(:port => 8080).url.should == 
        "#{request.scheme}://#{request.host}:8080#{request.request_uri}"
    end
    
    it "constructs a url using a path override" do
      request(:path => '/another/path').url.should == 
        "#{request.scheme}://#{request.host}#{request.request_uri}"
    end
    
    it "constructs a url with default query parameters" do
      request(:params => {'these' => 'params'}).url.should ==
        "#{request.scheme}://#{request.host}#{request.request_uri}"
      request.url.should match(/these=params$/)
    end

    describe "without an account or secret" do
      it "does not append the x_<params>" do
        request.url.should_not match(/x_/)
      end
    end
    
    describe "with an account" do
      it "appends the signature params" do
        url = request(:account => 'account').url
        query = Rack::Utils.parse_query(url.split('?').last)
        request.send(:signature_params).keys.each do |param_name|
          query.should have_key(param_name)
        end
      end

      describe "and a secret" do
        it "appends the signature params and x_sig with the signature" do
          url = request(:account => 'account', :secret => 'secret').url
          query = Rack::Utils.parse_query(url.split('?').last)
          signature_params = request.send(:signature_params).keys
          signature_params.each do |param_name|
            query.should have_key(param_name)
          end
          query.should have_key('x_sig')
        end
      end
    end
  end
  
  describe "private methods" do
    
    describe "append_signature" do
      it "should append the signature as the x_sig parameter at the end of the query string" do
        url = 'http://example.com/path?query=string'
        signed_url = request.send(:append_signature, url, 'secret')
        signed_url.should match(/^#{url.sub(/\?/, '\\?')}/)
        signed_url.should match(/x_sig=[-\w]+(?:%3D)*$/)
      end
    end

    describe "signature_params" do
      describe "without an account present" do
        it "should return an empty hash" do
          request.send(:signature_params).should == {}
        end
      end

      describe "with an account present" do
        before(:each) do
          @params = request(:account => 'account').send(:signature_params)
        end

        it "should return a hash with the x_name parameter with the account name" do
          @params.should have_key('x_name')
          @params['x_name'].should == 'account'
        end

        it "should return a hash with the x_time parameter with the current milliseconds since epoch" do
          @params.should have_key('x_time')
          @params['x_time'].should be_close(Time.now.to_i_with_milliseconds, 100)
        end

        it "should return a hash with the x_nonce parameter of the format \d+.\d+" do
          @params.should have_key('x_nonce')
          @params['x_nonce'].should match(/^\d+.\d+$/)
        end

        it "should return a hash with the x_method parameter with the signing method name" do
          @params.should have_key('x_method')
          @params['x_method'].should == Cloudquery::SIGNING_METHOD
        end
      end
    end

    describe "query_str" do
      it "builds a query string from the request params" do
        request(:params => {'these' => 'params'})
        request.send(:query_str).should == 'these=params'
      end

      it "url-encodes params with non alphanumeric characters (outside [ a-zA-Z0-9-._])" do
        request(:params => {'weird' => 'values=here'})
        request.send(:query_str).should == 'weird=values%3Dhere'
      end

      it "returns an empty string when no params are present" do
        request(:params => {}).send(:query_str) == ""
      end
    end

    describe "base_uri" do
      it "returns an http url when the scheme is http" do
        request(:scheme => 'http').send(:base_uri).should be_an_instance_of(URI::HTTP)
      end
      it "returns an https url when the scheme is https" do
        request(:scheme => 'https').send(:base_uri).should be_an_instance_of(URI::HTTPS)
      end
    end
  end

end

describe Cloudquery::Crypto::Random do
  describe "nonce generation" do
    it "generates a nonce with a random number, a dot, and the current time" do
      nonce = Cloudquery::Crypto::Random.nonce
      nonce.should match(/^\d+.\d+$/)
      random_digits, time = nonce.split('.')
      time.to_i.should be_close(Time.now.to_i, 1)
      random_digits.should match(/^\d+$/)
    end
  end
end

describe Cloudquery::Crypto::URLSafeSHA1 do
  describe "sign" do
    it "takes an arbitrary number of tokens to encrypt" do
      lambda { Cloudquery::Crypto::URLSafeSHA1.sign }.should_not raise_error
      lambda { Cloudquery::Crypto::URLSafeSHA1.sign('a') }.should_not raise_error
      lambda { Cloudquery::Crypto::URLSafeSHA1.sign('a', 'b', 'c') }.should_not raise_error
    end
    
    it "produces a url-safe base64 encoded SHA1 digest of tokens" do
      20.times do
        token = Cloudquery::Crypto::Random.nonce
        signature = Cloudquery::Crypto::URLSafeSHA1.sign(token)
        signature.should_not include('+')
        signature.should_not include('/')

        b64_digest = Base64.encode64(Digest::SHA1.digest(token)).chomp.tr('+/', '-_')
        signature.should == b64_digest
      end
    end
  end
end
