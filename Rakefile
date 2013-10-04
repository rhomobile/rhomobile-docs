require 'rubygems'
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
  client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  index = client.indexes(AppConfig['index'])
  index.delete rescue nil
  index.add rescue nil
  print "Waiting to initialize #{AppConfig['index']}..."
  while not index.running?
    print "."
    sleep 0.5
    $stdout.flush
  end
  Topic.all_topics.each do |doc|
    if File.exist?(doc) and File.basename(doc) != 'credits.txt'
      name = name_for(doc)
      puts "...indexing #{name}"
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
            result = indextank_document = index.document(name+chunknum.to_s).add(:title => topic.title, :text => chunk)
          end
          puts "=> #{result}"
          startPos = endPos + 1
          break if endPos == topic.body.size()
        end
      else
        result = indextank_document = index.document(name).add(:title => topic.title, :text => topic.body)
        puts "=> #{result}"
      end


    end
  end
  puts "finished indexing"
end

desc 'test'
task :index_test do
  Topic.all_topics.each do |doc|
    if File.exist?(doc) and File.basename(doc) != 'credits.txt'
      name = name_for(doc)
      # puts "...indexing #{name}"
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
  results = index.search(args[:query], :fetch => 'title', :snippet => 'text')
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
  apiXML = File.join(AppConfig['dirs']['api'],"**","*.xml")
  
  apiFiles = Dir.glob(apiXML)

  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['dirs']['api'],'')
    if basename != 'callback.xml' && basename != 'default_instance.xml' && basename != 'singleton_instances.xml' && basename != 'property_bag.xml' 
      # puts "Processing " + basename
    
      Api.analyze(fileName)
    end
  end

end

def process_xml
  puts 'rebuilding API docs'
  apiXML = File.join(AppConfig['dirs']['api'],"**","*.xml")
  
  apiFiles = Dir.glob(apiXML)

  # Links that go to 127.0.0.1:9393 (where no server is running) get styled dark red
  # Links that go to external sites (may not be reachable if user is truly offline) get italics
  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['dirs']['api'],'')
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
    
        dest = File.join(AppConfig['dirs']['api'],filename)
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

def which(command)
	ENV['PATH'].
		split(':').
		map  { |p| "#{p}/#{command}" }.
		find { |p| File.executable?(p) }
end

def name_for(doc)
  parts = doc.split('/')
  parts.size == 3 ? parts[1..-1].join('/').gsub(/\.txt/,'') : File.basename(doc, '.txt')
end
