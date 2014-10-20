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
	  index_hash = []
	  api_mapping = []
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
	    # Change links in MD to use hash scheme #parent folder-filename
	    md = replace_url md
	    md = replace_images md
	    md = replace_tables md
	    # md = replace_images md
	    # md = replace_tables md

	    hash_object =   {
	    	:key => "#{parent}-#{basename.gsub('.md','')}",
	      :name => title,
	      :md => md
	    }
	    api_object = {
	    	:name => hash_object[:name],
	    	:link => "##{hash_object[:key]}"
	    }
	    api_mapping.push api_object
	    index_hash.push hash_object    
	  end

	  guidesMD = File.join(AppConfig['guides_eb'],"**","*.md")
	  guidesFiles = Dir.glob(guidesMD)

	  guidesFiles.each do |fileName|
	    basename = fileName.gsub(AppConfig['guides_eb'],'')
	    parent = Pathname(fileName.gsub(basename,'')).each_filename.to_a.last
      	hash_key = parent + "-"+ basename.gsub('/','-')
      	md = File.read(fileName)
	    if md.match(/#(.*)$/).nil? 
	    	title = basename.gsub('.md','')
	    else
		    title = md.match(/#(.*)$/)[1]
	    end
		
	    puts "Processing Guide: #{title} in #{basename}"

	    md = replace_url md
	    md = replace_images md
	    md = replace_tables md
	    hash_object =   {
    		:key => "#{hash_key.gsub('.md','')}",
	      	:name => title,
	      	:md => md
	    }
	    index_hash.push hash_object    
	  end

	  outputfile = "#{AppConfig['offline_eb_mapping']}"
		File.open("#{outputfile}", 'w') {|f| 
			f.write("var docs = #{index_hash.to_json};") 
		}
		
	end

	def self.replace_url (md)

	    md_mod = md.gsub(/\[.*?\]\((.*?)\)/) do |m|
	      match = $1
	      # if starts with ../ then use the string minus the ../ for the index
	      if match.start_with?('../') 
	        #strip leading path
	        new_url = match.gsub('../','')
	        #replace seperator
	        new_url.gsub!('/','-')
	        # add a hash symbol in fron
	        # new_url => #parentFolder-filename
	        new_url = "##{new_url}"
	        puts "#{match} => #{new_url}"
	        m.gsub(match,new_url)
	      else
	      	#leave alone
	      	m
	      end
	    end
		return md_mod    
  	end

  	def self.replace_images(md)

  		md_mod = md
  		#if imageVersion is passed in via Rake command
  		# then the images for offline content will go in a subfolder
  		# of the images folder. This is to account
  		# for different images for each version
  		# the guides will always have [img](images/theimage.jpg)
  		# will be replaced by [img](images/ENV['imageVersion']/theimage.jpg)
		if !ENV['imageVersion'].nil?
			md_mod = md.gsub(/\[img?\](\(.*?)\)/) do |m|
				match = $1
				#strip leading path
				new_url = match.gsub('(images/',"(#{ENV['imageVersion']}/")
				# puts "#{match} => #{new_url}"
				m.gsub(match,new_url)
		    end
  		end
		return md_mod    			

  	end

  	def self.replace_tables(md)

  		# replace any hardcode table html with some
  		# offline specific styling like Bootstrap and FontAwesome
  		# <table> => <table class='table'>
  		md_mod = md.gsub(/<table>/i, '<table class="table">')
  		# <TD>X => <TD><i class="fa fa-check-circle">
		md_mod = md_mod.gsub(/<td>X<\/td>/i, '<td><i class="fa fa-check-circle"></i>')
  		# <TD>- => <TD><i class="fa fa-times-circle">
		md_mod = md_mod.gsub(/<td>\-<\/td>/i, '<td><i class="fa fa-times-circle"></i>')
  		# <TD>* => <TD><i class="fa fa-times-circle">
		md_mod = md_mod.gsub(/<td>\*<\/td>/i, '<td><i class="fa fa-asterisk"></i>')
  		
		return md_mod    			

  	end

end
