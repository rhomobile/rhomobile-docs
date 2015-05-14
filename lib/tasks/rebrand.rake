desc 'Analyze current version toc for missing docs'
task :rebrand_moto do
	ctr = 0
	Topic.all_topics.each do |doc|
		source = File.read(doc)
		if source.scan(/Motorola/).size >0
				ctr += 1
			puts "...updating #{doc.gsub(".md", "")}"
		    source = source.gsub(/Motorola Solutions/,'Zebra Technologies')
		    source = source.gsub(/Motorola Webkit/,'Zebra Webkit')
		    source = source.gsub(/Motorola /,'Zebra ')
		end   
	end
	puts "...done: #{ctr} files updated"
end