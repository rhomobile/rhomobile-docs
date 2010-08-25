require 'indextank'
require 'topic'

desc 'Start a development server'
task :server do
	if which('shotgun')
		exec 'shotgun -O docs.rb'
	else
		warn 'warn: shotgun not installed; reloading is disabled.'
		exec 'ruby -rubygems docs.rb -p 9393'
	end
end

desc 'Index documentation'
task :index do
  puts "indexing now:"
  client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  index = client.indexes('heroku-docs')
  index.add unless index.exists?

  docs = FileList['docs/*.txt']
  docs.each do |doc|
    name = name_for(doc)
    puts "...indexing #{name}"
    source = File.read(doc)
    topic = Topic.load(name, source)
    topic.text_only
    result = indextank_document = index.document(name).add(:title => topic.title, :text => topic.body)
    puts "=> #{result}"
  end
  puts "finished indexing"
end

desc 'Sample search'
task :search, :query do |t, args|
  client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
  index = client.indexes('heroku-docs')
  results = index.search(args[:query], :fetch => 'title', :snippet => 'text')
  puts "#{results['matches']} results."
  puts results.inspect
end

task :start => :server

def which(command)
	ENV['PATH'].
		split(':').
		map  { |p| "#{p}/#{command}" }.
		find { |p| File.executable?(p) }
end

def name_for(doc)
  File.basename(doc, '.txt')
end

