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