require 'xmlsimple'
require 'rdiscount'
require 'rest-client'
require 'json'
class Offline
	def self.generate_json_index
	  puts "Getting MD in #{AppConfig['api_eb']}"
	  puts "Generating JSON Index: #{AppConfig['launchpad_eb']}index.json"
	  apiMD = File.join(AppConfig['api_eb'],"**","*.md")
	  
	  apiFiles = Dir.glob(apiMD)
	  index_hash = []
	  apiFiles.each do |fileName|
	    basename = fileName.gsub(AppConfig['api_eb'],'')
	    puts "Processing " + basename
	    hash_object = {
	      :name => basename.gsub('.md',''),
	      :md => File.read(fileName)
	    }
	    index_hash.push hash_object    
	  end

	  outputfile = "#{AppConfig['api_eb']}index.json"
		File.open("#{outputfile}", 'w') {|f| 
			f.write(index_hash.to_json) 
		}

	end
end
