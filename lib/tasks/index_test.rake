desc 'test'
task :index_test do
  Topic.all_topics.each do |doc|
    puts doc
    if File.exist?(doc) and File.basename(doc) != 'credits.md'
      name = name_for(doc)
      puts name
    end 
  end
  puts "finished indexing"
end