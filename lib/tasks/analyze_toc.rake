desc 'Analyze current version toc for missing docs'
task :analyze_toc do
  Topic.all_topics.each do |doc|
    # puts "...checking #{doc.gsub(".md", "")}"
      
    if TOC.find(doc.gsub(".md", "").gsub("docs/", "/")) == '' 
      puts "..........#{doc} - NOT FOUND IN TOC"        
    end
  end
  puts "...done"
end