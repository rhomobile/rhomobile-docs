require 'xmlsimple'
require 'rdiscount'
require 'rest-client'
require 'json'
class Offline
	def self.generate_json_index
	  puts "Getting MD in #{AppConfig['api_eb']}"
	  puts "Generating JSON Index: #{AppConfig['offline_eb']}#{AppConfig['offline_eb_mapping']}"
	  apiMD = File.join(AppConfig['api_eb'],"**","*.md")
	  apiFiles = Dir.glob(apiMD)
	  index_hash = {}
	  apiFiles.each do |fileName|
	    basename = fileName.gsub(AppConfig['api_eb'],'')
	    parent = Pathname(fileName.gsub(basename,'')).each_filename.to_a.last
      	md = File.read(fileName)
	    if md.match(/#(.*)$/).nil? 
	    	title = basename.gsub('.md','')
	    else
		    title = md.match(/#(.*)$/)[1]
	    end
		
	    puts "Processing API: #{title} in #{basename}"
	    hash_object =   {
	      :name => title,
	      :md => md
	    }
	    index_hash["#{parent}-#{basename.gsub('.md','')}"] = hash_object    
	  end

	  guidesMD = File.join(AppConfig['guides_eb'],"**","*.md")
	  guidesFiles = Dir.glob(guidesMD)

	  guidesFiles.each do |fileName|
	    basename = fileName.gsub(AppConfig['guides_eb'],'')
	    parent = Pathname(fileName.gsub(basename,'')).each_filename.to_a.last
      	md = File.read(fileName)
	    if md.match(/#(.*)$/).nil? 
	    	title = basename.gsub('.md','')
	    else
		    title = md.match(/#(.*)$/)[1]
	    end
		
	    puts "Processing Guide: #{title} in #{basename}"
	    hash_object =   {
	      :name => title,
	      :md => md
	    }
	    index_hash["#{parent}-#{basename.gsub('.md','')}"] = hash_object    
	  end

	  outputfile = "#{AppConfig['offline_eb_mapping']}"
		File.open("#{outputfile}", 'w') {|f| 
			f.write("var docs = #{index_hash.to_json};") 
		}

	end
end
