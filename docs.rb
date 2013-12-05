require 'sinatra'
require 'indextank'
require 'pdfkit'
require 'coderay'
require 'rack/codehighlighter'

require './topic'
require './indicators'
require './api'
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
    begin
    # puts "/v/2.2#{request.path}"
    # puts "****#{request.path.split('/')[1]}:#{request.path.split('/')[2]}"
    @alt_url = ''
    @alt_url = "#{request.scheme}://#{request.host}/en/2.2.0#{request.path}"
    topic = request.path.split('/')[2]
    subpath = request.path.split('/')[1]
    docversion = '2.2'
    if topic.include?('/')
        topic_file = topic
      elsif subpath
        if docversion.nil?
          topic_file = File.join(AppConfig['dirs'][subpath], "#{topic}.txt")
        else
          topic_file = File.join((AppConfig['dirs'][subpath]).gsub("docs/","en/#{docversion}/docs/"), "#{topic}.txt")
        end  
      else
        if docversion.nil?
         topic_file = "#{settings.root}/docs/#{topic}.txt"
        else
         topic_file = "#{settings.root}/en/#{docversion}/docs/#{topic}.txt"
        end
      end
    if  topic == 'apicompatibility'
      source = Indicators.apimatrix_markdown()  
    else
      source = File.read(topic_file)
    end
    source = source
    # puts "SOURCE:#{source}"
     topic = Topic.load(topic, source)
    @alt_title   = topic.title 
    @alt_content = topic.content
    @alt_intro   = topic.intro
    @alt = true
    erb :not_found

      
    rescue Exception => e
      puts "EROR:#{e}"
      @alt=false
      erb :not_found
      
    end
        
  
  end

  ['/', '/home', '/en/:vnum', '/en/:vnum/home'].each do |path|
    get path do
      @title = "Home"
      @print = 0
      @docversion = nil
      @docversion = params[:vnum]
      cache_long
    	erb :index


  	end
  end

  ['/en/2.2.0','/en/2.2.0/','/en/2.2.0/home'].each do |path|
    get path do
      @title = "Home"
      @print = 0
      @docversion = '2.2.0'
      cache_long
      erb :oldverhome
    end
  end

  get '/print/home' do 
    @print = 1
    cache_long
    erb :index
  end

  get '/search' do
    @print = 0
    # puts params
    page = params[:page].to_i
    category = params[:c]
    version = params[:v]
    total,dum_prev,dumb_next = search_for(params[:q], page, '','')

    search, prev_page, next_page = search_for(params[:q], page, params[:c],params[:v])

    #searchify object 
    categories = {}
      if !category.nil? && category != ''
        catArray = []
        catArray = category.split(",")
        categories["category"] = catArray
      end
      if !version.nil? && version != ''
        verArray = []
        verArray = version.split(",")
        categories["version"] = verArray
      end
      # puts total
    erb :search, :locals => {:search => search, :total => total, :query => params[:q], :category => category, :version => version, :prev_page => prev_page, :next_page => next_page, :categories => categories}
  end

  get '/opensearch' do
	content_type 'application/xml', :charset => 'utf-8'


    @print = 0
    page = params[:page].to_i
    search, prev_page, next_page = search_for(params[:q], page, params[:c],params[:v])
	
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
  
['/tutorial/:step/:topic/?',  '/tutorial/:topic/?'].each do |path|
    get path do
      cache_long
      @docversion = '4.0.0'

      # If the topic ends in ".pdf" or ".print", tell render_topic to use the print view
      
      @tut = TUT.steps(params[:topic])
      @doc = @tut[0]
      @docTitle = @tut[1]
      @baseurl = @tut[3]
      @steps = @tut[4]
      @topic = params[:topic]
      @step = params[:step]
      @prevStep = ''
      @nextStep = ''
      @currindex = -1
      @stepTitle = ''
      @steps.each do |gitlabel, title|

        @currindex += 1 if !@step.nil?
        @stepTitle = title if !@step.nil?
        break if @step == gitlabel
      end
      @prevStep = @steps[@currindex-1][0] if @currindex > 0
      @nextStep = @steps[@currindex+1][0] if @currindex < @steps.length-1
      @codediffUrl = "#{@baseurl}/compare/#{@prevStep}...#{@step}" if @prevStep != '' && @baseurl !=''

      topic_doc = params[:topic]
      if !@step.nil?
        topic_doc += '.' + @step
      end
      render_topic topic_doc, 'tutorial', 0, @docversion
      erb :tutorial
      
    end
  end

  #get '/:topic' do
  # TODO: use proper regex
  ['/en/:vnum/:topic/?', '/en/:vnum/:subpath/:topic/?'].each do |path|
    get path do
      puts params[:vnum]
      puts params[:subpath]
      puts params[:topic]

  	  cache_long
      @docversion = nil

      # If the topic ends in ".pdf" or ".print", tell render_topic to use the print view
      if params[:topic] =~ /(\.pdf|\.print)$/
        newtopic = params[:topic].gsub(/(\.pdf|\.print)/,"")
            render_topic newtopic, params[:subpath], 1
      
      else
        if params[:topic].nil?
          render_topic params[:topic], params[:subpath], 0
        else
          @docversion = params[:vnum]
          render_topic params[:topic], params[:subpath], 0, params[:vnum]
        end          

      end
    end
  end

  



  helpers do
  	def render_topic(topic, subpath = nil, print = 0, docversion = nil)
        puts "#{subpath} :#{topic} :  #{docversion}"
      if TOC.find("/#{subpath}/#{topic}") == '' && docversion.nil?
        
          #if not in TOC then make it default to 2.2 version
          # docversion='2.2'
          # @docversion = '2.2'
          # redirect "/v/#{docversion}/#{subpath}/#{topic}"
      end
      @topic_file = topic_file(topic,subpath,docversion)
       puts @topic_file
      if  topic == 'apicompatibility'
        source = Indicators.apimatrix_markdown()  
      else
        source = File.read(topic_file(topic, subpath,docversion))
      end
      source = source
      @topic = Topic.load(topic, source)
		
  		@title   = @topic.title 
  		@content = @topic.content
      @intro   = @topic.intro
      @indicatorslang = ""
      @oslist = ""

      if(subpath and topic)
  		  # @title  += Indicators.load('/' + subpath + '/' + topic + '/') 
         @indicatorslang = Indicators.languages('/' + subpath + '/' + topic + '/')
         @oslist = Indicators.oslist('/' + subpath + '/' + topic + '/')
      
		  end
  		@toc     = @topic.toc
  		@toc_sub     = @topic.toc_sub
      @body    = @topic.body
      		
  		@print = print
      if subpath.nil? || subpath == ''
        @topicmodel = Topic.model('/' + topic)
        erb :topic, :layout => !pjax?
      else
        @topicmodel = Topic.model(subpath + '/' + topic)
        if subpath == 'api'
          erb :topic_sidebar, :layout => !pjax?
        else
          erb :topic, :layout => !pjax?
        end
      end
      
  	rescue Errno::ENOENT
  		status 404
  	end
	
  	def search_for(query, page = 0, category='', version='')
      client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
      index = client.indexes(AppConfig['index'])
    
      categories = {}
      if !category.nil? && category != ''
        catArray = []
        catArray = category.split(",")
        categories["category"] = catArray
      end
      if !version.nil? && version != ''
        verArray = []
        verArray = version.split(",")
        categories["version"] = verArray
      end
      
      puts categories
      search = index.search(query, :start => page * 10, :len => 10, :fetch => 'title,dockey,version,category,docexternal', :snippet => 'text', :category_filters => categories)
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
	
  	def topic_file(topic, subpath = nil,docversion = nil )
      # puts "topic_file:#{topic}:#{subpath}:#{docversion}"
  	  if topic.include?('/')
        topic
  		# elsif subpath
    #     if docversion.nil?
    #       File.join(AppConfig['dirs'][subpath], "#{topic}.txt")
    #     else
    #       File.join((AppConfig['dirs'][subpath]).gsub("docs/","v/#{docversion}/docs/"), "#{topic}.txt")
    #     end  
  		else
        File.join("docs/en/#{docversion}/#{subpath}/#{topic}.txt")
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
      #toc.rb in root will be latest TOC
      #doc versions can have unique TOC found in /v/VERSION/toc.rb
      TOC.reload(params[:vnum])
  		TOC.sections
  	end

    def related
      #toc.rb in root will be latest TOC
      #doc versions can have unique TOC found in /v/VERSION/toc.rb
      
      TOC.related
    end

  	def next_section(current_slug, root=sections)
  		return sections.first if current_slug.nil?
  		# root.each_with_index do |(slug, title, group, topics), i|
  		# 	if current_slug == slug and i < root.length-1
  		# 		return root[i+1]
  		# 	elsif topics.any?
  		# 		res = next_section(current_slug, topics)
  		# 		return res if res
  		# 	end
  		# end
  		# nil
  	end
  
    def pjax?
      env['HTTP_X_PJAX'] || params['_pjax']
    end

  	alias_method :h, :escape_html
  end
end

module TOC
	extend self

  def reload(docversion)
    @sections = []
    if docversion.nil?
      file = File.dirname(__FILE__) + "/docs/en/4.0.0/toc.rb"
    else
      file = File.dirname(__FILE__) + "/docs/en/#{docversion}/toc.rb"
    end
    eval File.read(file), binding, file
  end

	def sections
		@sections ||= []

	end

	# define a section
	def section(name, title,group)
		sections << [name, title,group, []]
    yield if block_given?
	end


	# define a topic
	def topic(name, title)
		sections.last.last << [name, title, []]
	end
  
  def find(path)
     # puts "#{path}"
      
    compare = path.dup
    compare.slice!(0)
    compare.gsub!(/v\/([^\/]+)\//,'')
    found=''
    # found = @sections[0][0] # Default to first section
    @sections.map do |section|
      section[3].map do |slug, title, _|
        
        found = section[0] if slug == compare

      end
    end
    # puts "FOund:#{found}"
    found
  end

  def findGroup(path)
    compare = path.dup
    compare.slice!(0)
    compare.gsub!(/v\/([^\/]+)\//,'')
    
    found = 'Home' # Default to first section
    @sections.map do |section|
      section[3].map do |slug, title, group, _|
        
        found = section[2] if slug == compare

      end
    end
    found
  end
  	file = File.dirname(__FILE__) + '/docs/en/4.0.0/toc.rb'
	eval File.read(file), binding, file
end

module TUT
  extend self

  
  def tutorials
    @tutorials ||= []

  end

  # define a section
  def tutorial(name, title,group,giturl)
    tutorials << [name, title,group, giturl, []]
    yield if block_given?
  end

  # define a topic
  def gitlabel(name, title)
    tutorials.last.last << [name, title, []]
  end
  
  def steps(tut)
      # puts "#{tut}"
      
    
    found={}
    # found = @tutorials[0][0] # Default to first section
    @tutorials.each do |tutsection|
      # puts tutsection
      if tutsection[0] == tut
        found = tutsection
      end
      
    end
    # puts "FOund:#{found}"
    found
  end

 
  file = File.dirname(__FILE__) + '/tuts.rb'
  eval File.read(file), binding, file
end


