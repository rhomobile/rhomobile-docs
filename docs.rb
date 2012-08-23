require 'sinatra'
require 'indextank'
require 'pdfkit'
require 'coderay'
require 'rack/codehighlighter'

require './topic'
require './lib/term.rb'
require './pdfmaker'


class Docs < Sinatra::Base
  unless development?
    PDFKit.configure do |config|       
     config.wkhtmltopdf = File.expand_path(File.join( File.dirname(__FILE__), 'bin', 'wkhtmltopdf-amd64')).to_s
    end
  end

  use PdfMaker
  use Rack::Codehighlighter, :coderay, :markdown => true, :element => "pre>code", 
    :pattern => /\A:::(\w+)\s*(\n|&#x000A;)/i, :logging => false

  $LOAD_PATH << File.dirname(__FILE__) + '/lib'

  set :app_file, __FILE__
  enable :static
  
  not_found do
  	erb :not_found
  end

  ['/', '/home'].each do |path|
    get path do
      @title = "Home"
      @print = 0
  	  cache_long
    	erb :index
  	end
  end

  get '/print/home' do 
    @print = 1
    cache_long
    erb :index
  end

  get '/search' do
    @print = 0
    page = params[:page].to_i
    search, prev_page, next_page = search_for(params[:q], page)
    erb :search, :locals => {:search => search, :query => params[:q], :prev_page => prev_page, :next_page => next_page}
  end

  get '/opensearch' do
	content_type 'application/xml', :charset => 'utf-8'


    @print = 0
    page = params[:page].to_i
    search, prev_page, next_page = search_for(params[:q], page)
	
	xml_string = '<?xml version="1.0" encoding="UTF-8"?>'
xml_string +=  ' <rss version="2.0" '
xml_string +=  '  xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/"'
xml_string +=  '  xmlns:atom="http://www.w3.org/2005/Atom">'
xml_string +=  '    <channel>'
xml_string +=  '      <title>RhoMobile Suite Documentation</title>'
xml_string +=  '      <link>http://docs.rhomobile.com</link>'
xml_string +=  '      <description>Search results for docs.rhomobile.com</description>'
xml_string +=  '      <opensearch:totalResults>' + search['matches'].to_s + '</opensearch:totalResults>'
xml_string +=  '      <opensearch:startIndex>' + ((page + 1) * 10).to_s + '</opensearch:startIndex>'
xml_string +=  '      <opensearch:itemsPerPage>10</opensearch:itemsPerPage>'
xml_string +=  '      <opensearch:Query role="request" searchTerms="' + params[:q] + '" startPage="1" />'
search['results'].each do |result| 
xml_string +=  '<item>'
xml_string +=  '       <title><![CDATA[' + result['title'] + ']]></title>'
xml_string +=  '       <link>' + request.base_url + '/' + result['docid'] + '</link>'
xml_string +=  '<pubDate>' + File.mtime('docs/' + result['docid'] + '.txt').to_s + '</pubDate>'
xml_string +=  '       <description><![CDATA['
xml_string +=  result['snippet_text']
xml_string +=  '       ]]></description>'
xml_string +=  '     </item>'

end 
xml_string +=  '   </channel>'
xml_string +=  ' </rss>	'
#<?xml version="1.0" encoding="UTF-8"?>
# <rss version="2.0" 
#      xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/"
#      xmlns:atom="http://www.w3.org/2005/Atom">
#   <channel>
#     <title>Example.com Search: New York history</title>
#     <link>http://example.com/New+York+history</link>
#     <description>Search results for "New York history" at Example.com</description>
#     <opensearch:totalResults>4230000</opensearch:totalResults>
#     <opensearch:startIndex>21</opensearch:startIndex>
#     <opensearch:itemsPerPage>10</opensearch:itemsPerPage>
#     <atom:link rel="search" type="application/opensearchdescription+xml" href="http://example.com/opensearchdescription.xml"/>
#     <opensearch:Query role="request" searchTerms="New York History" startPage="1" />
#     <item>
#       <title>New York History</title>
#       <link>http://www.columbia.edu/cu/lweb/eguids/amerihist/nyc.html</link>
#       <description>
#         ... Harlem.NYC - A virtual tour and information on 
#         businesses ...  with historic photos of Columbia's own New York 
#         neighborhood ... Internet Resources for the City's History. ...
#       </description>
#     </item>
#   </channel>
# </rss>	

	#xml_string = '<?xml version="1.0" encoding="UTF-8"?>'
	#xml_string += '<rss version="2.0"  xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/"    xmlns:atom="http://www.w3.org/2005/Atom">'
#		xml_string += '   <channel>	     <title>Example.com Search: New York history</title>	     <link>http://example.com/New+York+history</link>	     <description>Search results for "New York history" at Example.com</description>	     <opensearch:totalResults>4230000</opensearch:totalResults>	     <opensearch:startIndex>21</opensearch:startIndex>	     <opensearch:itemsPerPage>10</opensearch:itemsPerPage>	     <atom:link rel="search" type="application/opensearchdescription+xml" href="http://example.com/opensearchdescription.xml"/>	     <opensearch:Query role="request" searchTerms="New York History" startPage="1" />	     <item>	       <title>New York History</title>	       <link>http://www.columbia.edu/cu/lweb/eguids/amerihist/nyc.html</link>	       <description>	         ... Harlem.NYC - A virtual tour and information on 	         businesses ...  with historic photos of Columbias own New York 	         neighborhood ... Internet Resources for the Citys History. ...	       </description>	     </item>	   </channel>	 </rss>'	
    xml_string
  end
  
  #get '/:topic' do
  # TODO: use proper regex
  ['/:topic/?', '/:subpath/:topic/?'].each do |path|
    get path do
  	  cache_long

      # If the topic ends in ".pdf" or ".print", tell render_topic to use the print view
      if params[:topic] =~ /(\.pdf|\.print)$/
        newtopic = params[:topic].gsub(/(\.pdf|\.print)/,"")
            render_topic newtopic, params[:subpath], 1
      
      else
      
        render_topic params[:topic], params[:subpath], 0

      end
    end
  end

  helpers do
  	def render_topic(topic, subpath = nil, print = 0)
  		source = File.read(topic_file(topic, subpath))
  		@topic = Topic.load(topic, source)
		
  		@title   = @topic.title
  		@content = @topic.content
  		@intro   = @topic.intro
  		@toc     = @topic.toc
  		@body    = @topic.body
      		
  		@print = print
      
  		erb :topic, :layout => !pjax?
  	rescue Errno::ENOENT
  		status 404
  	end
	
  	def search_for(query, page = 0)
      client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
      index = client.indexes(AppConfig['index'])
      search = index.search(query, :start => page * 10, :len => 10, :fetch => 'title', :snippet => 'text')
      next_page =
        if search and search['matches'] and search['matches'] > (page + 1) * 10
          page + 1
        end
      prev_page =
        if page > 0
          page - 1
        end

      [search, prev_page, next_page]
  	end
	
  	def topic_file(topic, subpath = nil)
  	  if topic.include?('/')
  	    topic
  		elsif subpath
  		  File.join(AppConfig['dirs'][subpath], "#{topic}.txt")
  		else
  			"#{settings.root}/docs/#{topic}.txt"
  		end
  	end
	
  	def topic_path
  	  params[:subpath] ? [params[:subpath],params[:topic]].join('/') : params[:topic]
    end

  	def cache_long
  		response['Cache-Control'] = "public, max-age=#{60 * 60}" unless development?
  	end

  	def slugify(title)
  		title.downcase.gsub(/[^a-z0-9 -]/, '').gsub(/ /, '-')
  	end

  	def sections
  		TOC.sections
  	end

  	def next_section(current_slug, root=sections)
  		return sections.first if current_slug.nil?
  		root.each_with_index do |(slug, title, topics), i|
  			if current_slug == slug and i < root.length-1
  				return root[i+1]
  			elsif topics.any?
  				res = next_section(current_slug, topics)
  				return res if res
  			end
  		end
  		nil
  	end
  
    def pjax?
      env['HTTP_X_PJAX'] || params['_pjax']
    end

  	alias_method :h, :escape_html
  end
end

module TOC
	extend self

	def sections
		@sections ||= []
	end

	# define a section
	def section(name, title)
		sections << [name, title, []]
		yield if block_given?
	end

	# define a topic
	def topic(name, title)
		sections.last.last << [name, title, []]
	end
  
  def find(path)
    compare = path.dup
    compare.slice!(0)
    found = @sections[0][0] # Default to first section
    @sections.map do |section|
      section[2].map do |slug, title, _|
        found = section[0] if slug == compare
      end
    end
    found
  end

	file = File.dirname(__FILE__) + '/toc.rb'
	eval File.read(file), binding, file
end
