require 'rubygems'
require 'date'
require 'bundler'
require './api'

Bundler.setup

require './environment'

desc 'Start a development server'
task :server do
    process_xml
  if which('shotgun')
		exec 'shotgun -O config.ru'
	else
		warn 'warn: shotgun not installed; reloading is disabled.'
		exec 'rackup config.ru -p 9393'
	end
end

desc 'Index documentation'
task :index do
  puts "indexing now:"
  # client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  # index = client.indexes(AppConfig['index'])
 

  # index.delete rescue nil
  # index.add rescue nil
  print "Waiting to initialize #{AppConfig['index']}..."
  while not index.running?
    print "."
    sleep 0.5
    $stdout.flush
  end
  Topic.all_topics.each do |doc|
    if File.exist?(doc) and File.basename(doc) != 'credits.txt'
      name = name_for(doc)
      version = version_for(doc)   #right now uses directory scheme and hardcoded current version 
      category = category_for(name) #right now uses directory scheme need to add multi category and other methods
      categories = { 
          'category' => category,
          'version' => version
      }
      puts "...indexing #{name},#{version},#{category}"
      source = File.read(doc)
      puts "#{File.size(doc)}"
      topic = Topic.load(name, source)
      topic.text_only
      maxsize = 100000
      if topic.body.size() > maxsize
        puts "Needs to be chunked #{topic.body.size()}"
        startPos = 0
        chunknum = 0
        loop do
          endPos = startPos + maxsize
          if endPos > topic.body.size()
            endPos = topic.body.size()
          end
          chunk = topic.body[startPos,endPos]
          chunknum +=1
          puts "Indexing chunk[#{chunknum}]: #{startPos},#{endPos}:#{chunk.size}" 
          if chunk.size > maxsize       
            puts "chunk size over limit WTF? - ognoring for now"
          else
            index.document(name+chunknum.to_s).delete()
            result = indextank_document = index.document(name+chunknum.to_s).add({:title => topic.title, :text => chunk, :dockey => name, :docexternal => false, :category => category, :version => version})
            
            index.document(name+chunknum.to_s).update_categories(categories)             
          end
          puts "=> #{result}"
          startPos = endPos + 1
          break if endPos == topic.body.size()
        end
      else
        index.document(name).delete()
        result = indextank_document = index.document(name).add({:title => topic.title, :text => topic.body, :dockey => name, :docexternal => false, :category => category, :version => version})
        index.document(name).update_categories(categories)
        puts "=> #{result}"
      end


    end
  end
  puts "finished indexing"
end

desc 'test'
task :index_test do
  Topic.all_topics.each do |doc|
    # puts doc
    if File.exist?(doc) and File.basename(doc) != 'credits.txt'
      name = name_for(doc)
      version = version_for(doc)   #right now uses directory scheme and hardcoded current version 
      category = category_for(name) #right now uses directory scheme need to add multi category and other methods

       puts "...indexing #{name}, version #{version}, category #{category}"
      source = File.read(doc)
      topic = Topic.load(name, source)
      topic.text_only
      maxsize = 100000
      if topic.body.size() > maxsize
        puts "#{name} Needs to be chunked #{topic.body.size()}"
        startPos = 0
        chunknum = 0

        loop do
          endPos = startPos + maxsize
          if endPos > topic.body.size()
            endPos = topic.body.size()
          end
          chunk = topic.body[startPos,endPos]
          chunknum +=1
          puts "Indexing chunk[#{chunknum}] : #{startPos},#{endPos}:#{chunk.size}"  
          if chunk.size > maxsize       
            puts "chunk size over limit WTF my chunk? logic is wrong - ignoring for now"
          else
            puts "will try to herokuindex"
          end      
          startPos = endPos + 1
          break if endPos == topic.body.size()
        end


      else
        # puts 'no need to chunk'
        # result = indextank_document = index.document(name).add(:title => topic.title, :text => topic.body)
      end
      # puts "=> #{result}"
    end
  end
  puts "finished indexing"
end

desc 'Sample search'
task :search, :query do |t, args|
  client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  index = client.indexes(AppConfig['index'])

  results = index.search(args[:query], :fetch => 'title,dockey,docexternal', :snippet => 'text')
  puts "#{results['matches']} results."
  puts results.inspect
end

desc 'Create offline archive'
task :archive do
  serverpid = Process.fork { Rake::Task['server'].invoke }

  puts "Waiting 3 seconds for server to start..."
  sleep 3

  `wget -mirror -k -E -nH -nv -P archive http://127.0.0.1:9393/`

  puts "Mirroring complete. Killing server."
  Process.kill(9,serverpid)

  Rake::Task['process_archive'].invoke

  puts "Done"

end

def analyze_xml
  apiXML = File.join(AppConfig['api'],"**","*.xml")
  
  apiFiles = Dir.glob(apiXML)

  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['api'],'')
    if basename != 'callback.xml' && basename != 'default_instance.xml' && basename != 'singleton_instances.xml' && basename != 'property_bag.xml' 
      puts "Processing " + basename
    
      Api.analyze(fileName)
    end
  end

end

def process_xml
  puts 'rebuilding API docs'
  apiXML = File.join(AppConfig['api'],"**","*.xml")
  
  apiFiles = Dir.glob(apiXML)

  # Links that go to 127.0.0.1:9393 (where no server is running) get styled dark red
  # Links that go to external sites (may not be reachable if user is truly offline) get italics
  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['api'],'')
    if basename != 'callback.xml' && basename != 'default_instance.xml' && basename != 'singleton_instances.xml' && basename != 'property_bag.xml' 
      puts "Processing " + basename
    
      Api.markdown(fileName)
    end
  end

end

def update_xml
 apiSources = AppConfig['api_sources'] || []
 apiSources.each do |s|
   apiSourceFolder = File.join(s,"**","*.xml")
    puts apiSourceFolder
   Dir.glob(apiSourceFolder).each do|f|
    filename = File.basename(f)
      puts filename
    doc = XmlSimple.xml_in(f)
    if !doc["MODULE"].nil?
      gendoc = "true"
      if filename !='AndroidManifest_rhomobile.xml' && filename != 'callback.xml' && filename != 'default_instance.xml' && filename != 'singleton_instances.xml' && filename != 'property_bag.xml' 
        # puts f
        # puts doc
        # puts "*****************************************"
        gendoc = doc["MODULE"][0]["generateDoc"]
      end
      # puts gendoc
      if (gendoc.nil? || gendoc == "true") && filename !='AndroidManifest_rhomobile.xml'
    
        dest = File.join(AppConfig['api'],filename)
        if !File.exists?(dest)
          puts "New: #{filename}"
        end
        # puts filename
        fileContents = IO.read(f)
        File.open(dest,"w") do |fd|
          fd.write(fileContents)
        end
      else

      end
    end
        
   end
 end

end


desc 'generate API docs from XML'
task :process_xml do
  process_xml
end

desc 'get updated XMl from other Git Repos '
task :update_xml do
  update_xml
end

desc 'Analyze XMl from inconsistancy '
task :analyze_xml do
  analyze_xml
end

desc 'Analyze current version toc for missing docs'
task :analyze_toc do
  Topic.all_topics.each do |doc|
    # puts "...checking #{doc.gsub(".txt", "")}"
      
    if TOC.find(doc.gsub(".txt", "").gsub("docs/", "/")) == '' 
      puts "..........#{doc} - NOT FOUND IN TOC"        
    end
  end
  puts "...done"
end

desc 'Apply inline CSS styling to offline archive files'
task :process_archive do

  downloadedHTML = File.join("archive","**","*.html")
  puts "\nHighlighting unclickable links..."

  htmlFiles = Dir.glob(downloadedHTML)

  # Links that go to 127.0.0.1:9393 (where no server is running) get styled dark red
  # Links that go to external sites (may not be reachable if user is truly offline) get italics
  htmlFiles.each do |fileName|
    puts "Processing " + fileName
    fileContents = IO.read(fileName)

    fileContents.gsub!(/href="(http:\/\/127.0.0.1:9393\/.*?)"/) do |match|
      #puts "Red: " + $1
      "style='color:darkred;cursor:pointer' title='" + $1 + " was unreachable'"
    end

    fileContents.gsub!(/href="http.*?"/) do |match|
      #puts "Italic: " + match
      match + ' style="font-style:italic"'
    end
    #puts ""

    File.open(fileName,"w") do |fd|
      fd.write(fileContents)
    end
  end

end

desc 'Push latest docs to edgedocs'
task :publish_edge do
  `git add .`
  `git commit -m "jenkins auto-commit"`
  `git push origin master`
  `git push edge master`
end

desc 'Publish docs to production'
task :publish_prod do
  `git pull`
  `git push production master`
  `heroku run rake index --app rhodocs`
end

desc 'Alias for server'
task :start => :server

desc 'index stackoverflow discussions'
task :index_stackoverflow do
  url = 'http://api.stackexchange.com/2.1/search?order=desc&sort=activity&tagged=rhomobile&site=stackoverflow&filter=withbody'
  get_stackoverflowitems url,1,100
end

desc 'index launchpad rhomobile blogs'
task :index_lp_blogs do
  url = "https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F3573)&filter=type(post)"
  get_launchpad_blogs url
end
desc 'index launchpad rhomobile & rhoconnect discussions'
task :index_lp_discussions do
  #rhomobile discussions
  url = "https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F3577)"
  get_lp_content url, 'discussion'
  url = "https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F3770)"
  get_lp_content url, 'discussion'

end

desc 'index launchpad videos'
task :index_lp_videos do
  url ="https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F5589)"
  get_lp_content url, 'video'
end  

def which(command)
	ENV['PATH'].
		split(':').
		map  { |p| "#{p}/#{command}" }.
		find { |p| File.executable?(p) }
end

def name_for(doc)
  # parts = doc.split('/')
  # parts.size == 3 ? parts[1..-1].join('/').gsub(/\.txt/,'') : File.basename(doc, '.txt')
  return doc.gsub(/\.txt/,'').gsub('docs/','')
end

def version_for(doc)
  re = /en\/(.*?)\//
  version = doc.match re
  if !version.nil? && !version.captures.nil?
    return version.captures[0]
  else
    return '4.0.0'
  end
end

def category_for(doc)
  
  reVersion = /en\/(.*?)\//
  reCat = /(.*?)\//
  doc = doc.gsub(reVersion,'')

  cat = doc.match reCat
  if !cat.nil? && !cat.captures.nil?
    return cat.captures[0]
  else
    return ''
  end
end

def get_stackoverflowitems url,page,pagesize
  rest_result = RestClient.get("#{url}&page=#{page}&pagesize=#{pagesize}").body
  
  client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  index = client.indexes(AppConfig['index'])

   
  categories = { 
          'category' => 'discussion',
          'version' => ''
      }

  if rest_result.code != 200
    puts ('Error communication with site')
    parsed = JSON.parse(rest_result)
    puts parsed["error_name"] 
    puts parsed["error_message"]
  else
    parsed = JSON.parse(rest_result)
    puts "Processing Page: #{page}, #{parsed['items'].length} , API Quota Remaining: #{parsed['quota_remaining']}"

    parsed["items"].each do |item|
     puts "indexing:" + item["title"]
     searchify_id = 'stackoverflow_'+ item["question_id"].to_s
      index.document(searchify_id).delete()
      doc_content = Nokogiri::HTML(item["body"]).text
      
     result = indextank_document = index.document(searchify_id).add({:title => item["title"], 
      :text => doc_content, :dockey => item["link"], 
      :docexternal => true, 
      :category => 'discussion', 
      :version => '',
      :timestamp => item["last_activity_date"]})
          index.document(searchify_id).update_categories(categories)
          puts "=> #{result}"
    end
    if parsed["has_more"]
      get_stackoverflowitems url,page+1,pagesize
    else
      puts "Done"
    end 
  end

end

def get_launchpad_blogs url
  rest_result = RestClient.get("#{url}").body

  client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  index = client.indexes(AppConfig['index'])
  categories = { 
          'category' => 'blog',
          'version' => ''
      }

  if rest_result.code != 200
    puts ('Error communication with site')
    # parsed = JSON.parse(rest_result)
    # puts parsed["error_name"] 
    # puts parsed["error_message"]
  else

    #jive prepends the JSON with this string for some reason
    rest_result.gsub!("throw 'allowIllegalResourceCall is false.';","")
    parsed = JSON.parse(rest_result)
     puts "Processing Starting Index: #{parsed['startIndex']}"
    # puts parsed

    parsed["list"].each do |item|
     puts "indexing:" + item["subject"]
     searchify_id = 'lp_blog_'+ item["id"].to_s
      index.document(searchify_id).delete()
      doc_content = Nokogiri::HTML(item["content"]["text"]).text
      result = indextank_document = index.document(searchify_id).add({:title => item["subject"], 
        :text => doc_content, 
        :dockey => item["permalink"], 
        :docexternal => true, 
        :category => 'blog', 
        :version => '',
        :timestamp => DateTime.parse(item["updated"]).to_time.to_i})
      index.document(searchify_id).update_categories(categories)
      puts "=> #{result}"
    end
    if !parsed["links"]["next"].nil? && parsed["links"]["next"] !=''
      get_launchpad_blogs parsed["links"]["next"]
    else
      puts "Done"
    end 
  end

end

def get_lp_content url,category
  rest_result = RestClient.get("#{url}").body
  client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  index = client.indexes(AppConfig['index'])
  categories = { 
          'category' => category,
          'version' => ''
      }

  if rest_result.code != 200
    puts ('Error communication with site')
    # parsed = JSON.parse(rest_result)
    # puts parsed["error_name"] 
    # puts parsed["error_message"]
  else
    #jive prepends the JSON with this string for some reason
    rest_result.gsub!("throw 'allowIllegalResourceCall is false.';","")
    parsed = JSON.parse(rest_result)
     puts "Processing Starting Index: #{parsed['startIndex']}"
    # puts parsed

    parsed["list"].each do |item|
     puts "indexing:" + item["subject"]
     searchify_id = 'lp_discussion_'+ item["id"].to_s
      index.document(searchify_id).delete()
      doc_content = Nokogiri::HTML(item["content"]["text"]).text
      result = indextank_document = index.document(searchify_id).add({:title => item["subject"], 
        :text => doc_content, :dockey => item["resources"]["html"]["ref"], 
        :docexternal => true, :category => category, 
        :version => '',
        :timestamp => DateTime.parse(item["updated"]).to_time.to_i})
      index.document(searchify_id).update_categories(categories)
      puts "=> #{result}"
    end
    if !parsed["links"]["next"].nil? && parsed["links"]["next"] !=''
      get_lp_content parsed["links"]["next"], category
    else
      puts "Done"
    end 
  end

end