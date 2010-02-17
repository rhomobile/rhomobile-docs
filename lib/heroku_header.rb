require 'rest_client'
require 'json'

module Heroku
  class Header
    def initialize(app, options={})
      @app     = app
      @active = options[:active]
      @theme   = options[:theme]
      update
    end

    def call(env)
      status, headers, body = @app.call(env)
      if headers['Content-Type'] == 'text/html' && body.respond_to?(:[]) && body[0] =~ /<body.*?>/
        body[0].gsub!(/(<head>)/, "\\1<style type='text/css'>#{@css}</style>")
        body[0].gsub!(/(<body.*?>\s*(<div .*?class='.*?container.*?'.*?>)?)/, "\\1#{@html}")
        body[0].gsub!(/(<\/body>)/, "#{@analytics}\\1") if insert_analytics?
        headers['Content-Length'] = body[0].size.to_s
      end
      [status, headers, body]
    end

    def insert_analytics?
      ENV['HEADER_ANALYTICS'] && @analytics
    end

    def update
      @html, @css, @analytics = fetch_latest
    end

    def header_url
      ENV['HEADER_URL'] || "http://header.heroku.com"
    end

    def heroku_domain
      ENV['HEROKU_HOST'] || 'heroku.com'
    end

    def fetch_latest
      url   = header_url.dup
      url << "/#{@theme}" if @theme
      url << "?active=#{@active}" if @active
      raw   = RestClient.get(url, :accept => :json)
      attrs = JSON.parse(raw)
      [attrs['html'], attrs['css'], attrs['analytics']]
    rescue => e
      STDERR.puts "Failed to fetch the Heroku header: #{e.class.name} - #{e.message}"
      nil
    end
  end
end
