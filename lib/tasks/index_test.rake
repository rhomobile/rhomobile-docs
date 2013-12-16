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