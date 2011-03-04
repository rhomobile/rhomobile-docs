require 'rubygems'
require 'bundler'
Bundler.setup

require './environment'

desc 'Start a development server'
task :server do
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
    if File.exist?(doc)
      name = name_for(doc)
      puts "...indexing #{name}"
      source = File.read(doc)
      topic = Topic.load(name, source)
      topic.text_only
      result = indextank_document = index.document(name).add(:title => topic.title, :text => topic.body)
      puts "=> #{result}"
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

desc 'Load doc files from config.yml dirs'
task :load do
  AppConfig['dirs'].each do |name,dir|
    if File.exist?(dir) and not dir == 'docs/'
      puts "Copying #{dir}*.txt to docs/#{name}"
      `rm -rf docs/#{name}`
      `mkdir -p docs/#{name}`
      `cp #{dir}*.txt docs/#{name}`
    end
  end
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

desc 'Load latest docs and publish to edge'
task :publish_edge => :load do
  `git add .`
  `git commit -m "cijoe auto-commit"`
  `git push origin master`
  `git push edge master`
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
