require 'xmlsimple'
require 'rdiscount'
require 'rest-client'
require 'json'
require 'pathname'

class Launchpad
	@my_server = 'developer-uat.motorolasolutions.com/api/core/v3'
	@my_user = ENV['user']
	@my_pass = ENV['password']
  @current_env = ENV['server'].nil? ? "uat" : ENV['server']

  #parent places are per folder
  @servers = {
    "uat" =>{
      "server" => "developer-uat.motorolasolutions.com/api/core/v3",
      "parent_places" => {
        "api/" => "",
        "guide/" => "",
        "guide/tutorial/" => "",
      }
    },
    "prod" =>{
      "server" => "developer.motorolasolutions.com/api/core/v3",
      "parent_places" => {
        "api/" => "https://developer.motorolasolutions.com/api/core/v3/places/38912",
        "guide/" => "https://developer.motorolasolutions.com/api/core/v3/places/38904",
        "guide/tutorial/" => "https://developer.motorolasolutions.com/api/core/v3/places/38904",
      }
    }

  }

  @my_server = @servers[@current_env]["server"]
  
  def self.generate_html(topic,parent_source)
    #open Markdown content
    md = File.read(topic)
		
    md = replace_images(md)
    
    # Replace html
    md = replace_url_md (md)

    #Change APi links 
    if topic.start_with?('docs/api')
      # basename = topic.gsub(AppConfig['api_eb'],'')
      # md = convert_api_links md,basename.gsub('.md','')
    end  
		#pre-pend LP specific code
		html = "<div class='tableofcontents'> </div>" 

		# Add Markdown converted to HTML
  		html += RDiscount.new(md, :smart).to_html 	

  		# Reformat code blocks
  		# html = html.gsub(/<pre><code>(.*?)<\/code><\/pre>/m) do |m|
      		 # m.gsub("<pre><code>","<pre class=\"jive_text_macro jive_macro_code\" jivemacro=\"code\" ___default_attr=\"javascript\" _jivemacro_uid=\"_1398870592774641\">").gsub("</code></pre>","</pre>")
    	# end

      # Need to add to Launchpad theme on doc load:
      # dp.SyntaxHighlighter.HighlightAll()
      html.gsub!(/<pre><code> :::(\w+)\s*(\n|&#x000A;)/, '<pre name="code" class="\1">')
      html.gsub!('</code></pre>','</pre>')
  		
      html.gsub!(/<pre><code>:::(\w+)\s*(\n|&#x000A;)/, '<pre name="code" class="\1">')
      html.gsub!('</code></pre>','</pre>')
      
      
  		# write html file
  		basename = topic.gsub(parent_source,'')
      parent_output = Pathname(parent_source).each_filename.to_a.last
    	outputfile = "#{AppConfig['launchpad_eb']}#{parent_output}/#{basename.gsub!('.md','.html')}"
	  	File.open("#{outputfile}", 'w') {|f| 
	  		f.write(html) 
        # puts outputfile
	  	}
	
  end
  
  def self.replace_url (topic,url_map,env)
    # find all a href="" and decide if it should be changed

    # read file contents
    html = File.read(topic)
    matched = false
    html_mod = html.gsub(/<a href="(.*?)"/m) do |m|
      match = $1
      index_key = $1
      # if starts with ../ then use the string minus the ../ for the index
      if index_key.start_with?('../') 
        index_key.gsub!('../','')
      end
      # otherwise use the match for the lookup
      if url_map[index_key].nil?
        # do nothing, myable external url or one we do not know
        m
      else
        # if exisrts in mapping but is blank then we need to create it
        if url_map[index_key]["url"][env] == ""
          puts "\nERROR: #{index_key} missing url"
          m
        else
          # get the lookup for the real LP url
          # then replace the a href tag with the lookup
          matched = true
          newurl = url_map[index_key]["url"][env]
          
          m.gsub(match,url_map[index_key]["url"][env])
        end
      end      
      
    end
    if matched
      puts "\nReposting #{topic}"
      publish_html(topic,html_mod,url_map,env)
    end
  end
  
 def self.replace_url_md (md)
    # find all a href="" and decide if it should be changed
    
    # TEMP Move to rake task
    url_map = eval(File.read("#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"))
    env = ENV['server']

    # read file contents
    matched = false
    md_mod = md.gsub(/\[.*?\]\((.*?)\)/) do |m|
      match = $1
      index_key = $1
      # if starts with ../ then use the string minus the ../ for the index
      if index_key.start_with?('../') 
        index_key.gsub!('../','')
      end
      # otherwise use the match for the lookup
      if url_map[index_key].nil?
        # do nothing, myable external url or one we do not know
        m
      else
        # if exisrts in mapping but is blank then we need to create it
        if url_map[index_key]["url"][env] == ""
          puts "\nERROR: #{index_key} missing url"
          m
        else
          # get the lookup for the real LP url
          # then replace the a href tag with the lookup
          matched = true
          newurl = url_map[index_key]["url"][env]
          # puts "\nMATCH: #{index_key} => #{newurl}"
          m.gsub(match,url_map[index_key]["url"][env])
        end
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
  
  def self.convert_api_links (md,classname)
    # api links will be in standard javadocs format
    url_map = eval(File.read("#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"))
    env = ENV['server']

    md_mod = md.gsub(/\[.*?\]\((.*?)\)/) do |m|
        match = $1
       if !match.start_with?('http')   
        if match.start_with?('#')
          # Links that are within same 'class' look like
          # #EMDKResults
          # need to  change to api-[CurrentFile]?EMDKResults
          index_key = "api/#{classname}" #"#{match.gsub('#','?')}"
          if url_map[index_key]["url"][env] == ""
            puts "\nERROR: #{index_key} missing url"
            m
          else
            # get the lookup for the real LP url
            # then replace the a href tag with the lookup
            matched = true
            newurl = url_map[index_key]["url"][env] #+ match.downcase
            # puts "\nMATCH: #{index_key} => #{newurl}"
            m.gsub("(#{match})","(#{newurl})")
          end          
        else
          # [package.class#member](label)
          # EMDKManager.EMDKListener => api-EMDKManager-EMDKListener
          # member could be fields, methods, etc
          # methods may have several oberloads so link will be
          # complete method description
          link_class = match
            
          link_jump = ''
          if match.include?('#')
            # then the link has a jump
            link_class = match.split("#").first
            
            link_jump = "#{match.split("#").last}"
          end

          if isEnum(link_class)
            link_class = match.gsub('.'+match.split(".").last,'')
            link_jump = "#{match.split(".").last}" 
          end

          #change dots to dashes
          link_class = link_class.gsub('.','-')
          index_key = "api/#{link_class}"
          if url_map[index_key]["url"][env] == ""
            puts "\nERROR: #{index_key} missing url"
            m
          else
            # get the lookup for the real LP url
            # then replace the a href tag with the lookup
            matched = true
            newurl = url_map[index_key]["url"][env] #+ link_jump.downcase
            # puts "\nMATCH: #{index_key} => #{newurl}"
            m.gsub("(#{match})","(#{newurl})")
          end          


        end
       end
      end
    return md_mod    
  end

  def self.isEnum(className)
    # Classname.blah

    # Check if class file exists
    fileCheck = AppConfig['api_eb']+className.gsub('.','-')+'.md'
    if File.file?(fileCheck)
      return false
    else
      #otherwise it is an enum 
      return true
    end


  end

  def self.publish_html(topic,html,url_map,env)
    
  	# read file contents
  	warnings = [] #missing titles or unable to post
    newfiles = [] #file is a new post to Launchpad
    missingfiles = [] #file is missed from mapping
    
    basename = topic.gsub(AppConfig['launchpad_eb'],'')
    topicfile= Pathname(basename).each_filename.to_a.last
    parent = basename.gsub(topicfile,'')
    index_key = parent + topicfile.gsub('.html','')
    
    if url_map[index_key].nil?
      #need to create doc in LP and also update mapping
      create_doc = true
    else
      create_doc = false
      # if exisrts in mapping but is blank then we need to create it
      if url_map[index_key]["id"][env] == ""
        create_doc = true
      end
    end

    if html.match(/<h1>(.*)<\/h1>/).nil? 
      puts ("WARNING: No H1 Title #{topic}")
      title = File.basename(topic).gsub('.html','')
    else
      title = html.match(/<h1>(.*)<\/h1>/)[1]
      #remove H1 as Launchpad auto puts in H1 for Doc title
      html.gsub!(/<h1>(.*)<\/h1>/,'')
    end

    if @servers[@current_env]["parent_places"][parent].nil? || @servers[@current_env]["parent_places"][parent] ==""
      puts ("ERROR: No launchpad Parent for #{topic}")
    else
    # create REST JSON Body		
      jdata = {
      	:visibility => 'place',
      	:subject => title,
      	:content => {
      		:type => 'text/html',
      		:text => html
      		},
      	:type => 'document',
        :minor => true,
      	:parent => @servers[@current_env]["parent_places"][parent]
      	}.to_json
        
      begin
        if create_doc
           puts "Creating:#{title}"
          rest_method = "post"
          # Jive V3 Endpoint
          endpoint = "https://#{@my_user}:#{@my_pass}@#{@my_server}/contents"
          
        else
           puts "Updating:#{title}"
          rest_method = "put"
          # Jive V3 Endpoint
          endpoint = url_map[index_key]["id"][env].gsub("https://","https://#{@my_user}:#{@my_pass}@")
        end
        # puts endpoint
        # puts "\n #{index_key} => #{rest_method} => #{@servers[@current_env]["parent_places"][parent]}"
        
      	# Create Doc
      	response = RestClient::Request.execute :method=> rest_method, :url => endpoint, 
      	:headers => {'Content-Type' => 'application/json'}, 
      	:payload => jdata 

      		#response.code = 201 is success, else parsed.message = error message, parsed.code
      	parsed = JSON.parse(response)
          if url_map[index_key].nil?
            #add to mapping file
            hash_object = {
                  "id" => 
                    {
                      "uat" => "",
                      "prod" => ""
                    },
                    "url" => 
                    {
                      "uat" => "",
                      "prod" => ""
                    },
                    "parent" => 
                    {
                      "uat" => "",
                      "prod" => ""
                    }
                }
            url_map[index_key] = hash_object
          end
          #Jive REST API for Document Update
          url_map[index_key]["id"][env] = parsed["resources"]["self"]["ref"]
          #Jive URL to document
          url_map[index_key]["url"][env] = parsed["resources"]["html"]["ref"]
          # puts url_map[index_key]
          outputfile = "#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"
          File.open("#{outputfile}", 'w') {|f| 
            f.write(url_map.to_s) 
          }
          # puts "Success: ID => #{@documentId}"
        
      rescue => e
        puts "\nERROR: #{topic}:#{e} - check #{topic}.error for JSON - File may have malformed HTML - check for Amperstand escaping"
        File.open(topic+'.error','w'){|f| 
            f.write(jdata) 
          }
      end
    
    end     
  end

  def self.delete_doc(topic,url_map,env)

    # read file contents
    html = File.read(topic)
    warnings = [] #missing titles or unable to post
    newfiles = [] #file is a new post to Launchpad
    missingfiles = [] #file is missed from mapping
    
    index_key = topic.gsub(AppConfig['launchpad_eb'],'').gsub('.html','')
    if url_map[index_key].nil?
      #need to create doc in LP and also update mapping
      new_doc = true
    else
      new_doc = false
      # if exisrts in mapping but is blank then we need to create it
      if url_map[index_key]["id"][env] == ""
        new_doc = true
      end
    end
   
    begin
      if new_doc
        #just ignore it
      
      else
        # puts "Updating"
        rest_method = "delete"
        # Jive V3 Endpoint
        endpoint = url_map[index_key]["id"][env].gsub("https://","https://#{@my_user}:#{@my_pass}@")
      # Delete Doc
      response = RestClient::Request.execute :method=> rest_method, :url => endpoint, 
      :headers => {'Content-Type' => 'application/json'}
       

        #response.code = 201 is success, else parsed.message = error message, parsed.code
        # if response.code == 201
          #Jive REST API for Document Update
          url_map[index_key]["id"][env] = ""
          #Jive URL to document
          url_map[index_key]["url"][env] = ""
          # puts url_map[index_key]
          outputfile = "#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"
          File.open("#{outputfile}", 'w') {|f| 
            f.write(url_map.to_s) 
          }
        # else
          # puts "ERROR: #{topic}:#{response.code}#{response.message}"
        # end
      end
      
    rescue => e
      puts "\nERROR: #{topic}:#{e.response}"
      response =  JSON.parse(e.response.to_s)
      if response["error"]["status"] == 404
        # then doc does not exist on LP so clear mapping anyway
        url_map[index_key]["id"][env] = ""
        #Jive URL to document
        url_map[index_key]["url"][env] = ""
        # puts url_map[index_key]
        outputfile = "#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"
        File.open("#{outputfile}", 'w') {|f| 
          f.write(url_map.to_s) 
        }
      end
    end
    
         
  end
   
  # Used to created baseline hash object stored in file 
  # to be used to track mapping of files created on launchpad
  def self.generate_mapping_index
    warning = ""
    index_hash = {}
    puts "Getting MD in #{AppConfig['api_eb']}"
    puts "Generating JSON Index: #{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"
    apiMD = File.join(AppConfig['api_eb'],"**","*.md")
    apiFiles = Dir.glob(apiMD)
    apiFiles.each do |fileName|
      # use parent folder/name as index key
      basename = fileName.gsub(AppConfig['api_eb'],'')
      parent = Pathname(fileName.gsub(basename,'')).each_filename.to_a.last
      puts "Parent: #{parent}"
      index_key = parent + "/" + fileName.gsub(AppConfig['api_eb'],'').gsub('.md','')

      md = File.read(fileName)
    
      puts "Processing API: #{index_key}"
      hash_object = {
        "id" => 
          {
            "uat" => "",
            "prod" => ""
          },
          "url" => 
          {
            "uat" => "",
            "prod" => ""
          },
          "parent" => 
          {
            "uat" => "",
            "prod" => ""
          }
      }
      index_hash[index_key] = hash_object    
    end

    guidesMD = File.join(AppConfig['guides_eb'],"**","*.md")
    guidesFiles = Dir.glob(guidesMD)
    guidesFiles.each do |fileName|
      # use parent folder/name as index key
      basename = fileName.gsub(AppConfig['guides_eb'],'')
      parent = Pathname(fileName.gsub(basename,'')).each_filename.to_a.last
      index_key = parent + "/" + fileName.gsub(AppConfig['guides_eb'],'').gsub('.md','')

      md = File.read(fileName)
    
      puts "Processing Guide: #{index_key}"
      hash_object = {
        "id" => 
          {
            "uat" => "",
            "prod" => ""
          },
          "url" => 
          {
            "uat" => "",
            "prod" => ""
          },
          "parent" => 
          {
            "uat" => "",
            "prod" => ""
          }
      }
      index_hash[index_key] = hash_object    
    end

    
    outputfile = "#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"
    if File.file?(outputfile)
      puts "**** WARNING: previous mapping existed - last one saved in #{AppConfig['launchpad_eb_mapping']}.backup"
      #save copy
      outputfile_backup = outputfile + '.backup'
      File.rename(outputfile,outputfile_backup)
    end
    File.open("#{outputfile}", 'w') {|f| 
      f.write(index_hash.to_s) 
    }
    puts "Finished"
    puts warning
  end

end
