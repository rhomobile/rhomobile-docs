def get_lp_content url,category
  rest_result = RestClient.get("#{url}").body
  client = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'])
  index = client.indexes(AppConfig['index'])
  categories = { 
          'category' => category,
          'version' => ''
      }

  if rest_result.code != 200
    puts ('Error communication with site')
    # parsed = JSON.parse(rest_result)
    # puts parsed["error_name"] 
    # puts parsed["error_message"]
  else
    #jive prepends the JSON with this string for some reason
    rest_result.gsub!("throw 'allowIllegalResourceCall is false.';","")
    parsed = JSON.parse(rest_result)
     puts "Processing Starting Index: #{parsed['startIndex']}"
    # puts parsed

    parsed["list"].each do |item|
     puts "indexing:" + item["subject"]
     searchify_id = 'lp_discussion_'+ item["id"].to_s
      index.document(searchify_id).delete()
      doc_content = Nokogiri::HTML(item["content"]["text"]).text
      result = indextank_document = index.document(searchify_id).add({:title => item["subject"], 
        :text => doc_content, :dockey => item["resources"]["html"]["ref"], 
        :docexternal => true, :category => category, 
        :version => '',
        :timestamp => DateTime.parse(item["updated"]).to_time.to_i})
      index.document(searchify_id).update_categories(categories)
      puts "=> #{result}"
    end
    if !parsed["links"]["next"].nil? && parsed["links"]["next"] !=''
      get_lp_content parsed["links"]["next"], category
    else
      puts "Done"
    end
  end
end

def get_launchpad_blogs url
  rest_result = RestClient.get("#{url}").body

  client = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'])
  index = client.indexes(AppConfig['index'])
  categories = { 
          'category' => 'blog',
          'version' => ''
      }

  if rest_result.code != 200
    puts ('Error communication with site')
    # parsed = JSON.parse(rest_result)
    # puts parsed["error_name"] 
    # puts parsed["error_message"]
  else

    #jive prepends the JSON with this string for some reason
    rest_result.gsub!("throw 'allowIllegalResourceCall is false.';","")
    parsed = JSON.parse(rest_result)
     puts "Processing Starting Index: #{parsed['startIndex']}"
    # puts parsed

    parsed["list"].each do |item|
     puts "indexing:" + item["subject"]
     searchify_id = 'lp_blog_'+ item["id"].to_s
      index.document(searchify_id).delete()
      doc_content = Nokogiri::HTML(item["content"]["text"]).text
      result = indextank_document = index.document(searchify_id).add({:title => item["subject"], 
        :text => doc_content, 
        :dockey => item["permalink"], 
        :docexternal => true, 
        :category => 'blog', 
        :version => '',
        :timestamp => DateTime.parse(item["updated"]).to_time.to_i})
      index.document(searchify_id).update_categories(categories)
      puts "=> #{result}"
    end
    if !parsed["links"]["next"].nil? && parsed["links"]["next"] !=''
      get_launchpad_blogs parsed["links"]["next"]
    else
      puts "Done"
    end 
  end
end

def get_stackoverflowitems url,page,pagesize
  rest_result = RestClient.get("#{url}&page=#{page}&pagesize=#{pagesize}").body
  client = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'])
  index = client.indexes(AppConfig['index'])
  categories = { 
          'category' => 'discussion',
          'version' => ''
      }

  if rest_result.code != 200
    puts ('Error communication with site')
    parsed = JSON.parse(rest_result)
    puts parsed["error_name"] 
    puts parsed["error_message"]
  else
    parsed = JSON.parse(rest_result)
    puts "Processing Page: #{page}, #{parsed['items'].length} , API Quota Remaining: #{parsed['quota_remaining']}"

    parsed["items"].each do |item|
     puts "indexing:" + item["title"]
     searchify_id = 'stackoverflow_'+ item["question_id"].to_s
      index.document(searchify_id).delete()
      doc_content = Nokogiri::HTML(item["body"]).text
      
     result = indextank_document = index.document(searchify_id).add({:title => item["title"], 
      :text => doc_content, :dockey => item["link"], 
      :docexternal => true, 
      :category => 'discussion', 
      :version => '',
      :timestamp => item["last_activity_date"]})
          index.document(searchify_id).update_categories(categories)
          puts "=> #{result}"
    end
    if parsed["has_more"]
      get_stackoverflowitems url,page+1,pagesize
    else
      puts "Done"
    end
  end
end

def analyze_xml
  apiXML = File.join(AppConfig['api'],"**","*.xml")
  
  apiFiles = Dir.glob(apiXML)

  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['api'],'')
    if basename != 'callback.xml' && basename != 'default_instance.xml' && basename != 'singleton_instances.xml' && basename != 'property_bag.xml' 
      puts "Processing " + basename
    
      Api.analyze(fileName)
    end
  end
end

def process_xml
  puts 'rebuilding API docs'
  apiXML = File.join(AppConfig['api'],"**","*.xml")
  
  apiFiles = Dir.glob(apiXML)

  # Links that go to 127.0.0.1:9393 (where no server is running) get styled dark red
  # Links that go to external sites (may not be reachable if user is truly offline) get italics
  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['api'],'')
    if basename != 'callback.xml' && basename != 'default_instance.xml' && basename != 'singleton_instances.xml' && basename != 'property_bag.xml' 
      puts "Processing " + basename
    
      Api.markdown(fileName)
    end
  end
end

def process_xml_eb
  puts 'rebuilding API docs'
  apiXML = File.join(AppConfig['api_eb'],"**","*.xml")
  
  apiFiles = Dir.glob(apiXML)

  # Links that go to 127.0.0.1:9393 (where no server is running) get styled dark red
  # Links that go to external sites (may not be reachable if user is truly offline) get italics
  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['api_eb'],'')
    if basename != 'callback.xml' && basename != 'default_instance.xml' && basename != 'singleton_instances.xml' && basename != 'property_bag.xml' 
      puts "Processing " + basename
    
      Apieb.markdown(fileName)
    end
  end
end

def update_xml
 apiSources = AppConfig['api_sources'] || []
 apiSources.each do |s|
   apiSourceFolder = File.join(s,"**","*.xml")
    puts apiSourceFolder
   Dir.glob(apiSourceFolder).each do|f|
    filename = File.basename(f)
      puts filename
    doc = XmlSimple.xml_in(f)
    if !doc["MODULE"].nil?
      gendoc = "true"
      if filename !='AndroidManifest_rhomobile.xml' && filename != 'callback.xml' && filename != 'default_instance.xml' && filename != 'singleton_instances.xml' && filename != 'property_bag.xml' 
        # puts f
        # puts doc
        # puts "*****************************************"
        gendoc = doc["MODULE"][0]["generateDoc"]
      end
      # puts gendoc
      if (gendoc.nil? || gendoc == "true") && filename !='AndroidManifest_rhomobile.xml'
    
        dest = File.join(AppConfig['api'],filename)
        if !File.exists?(dest)
          puts "New: #{filename}"
        end
        # puts filename
        fileContents = IO.read(f)
        File.open(dest,"w") do |fd|
          fd.write(fileContents)
        end
      else
      end
    end
   end
 end
end

def which(command)
  ENV['PATH'].
    split(':').
    map  { |p| "#{p}/#{command}" }.
    find { |p| File.executable?(p) }
end

def name_for(doc)
  # parts = doc.split('/')
  # parts.size == 3 ? parts[1..-1].join('/').gsub(/\.md/,'') : File.basename(doc, '.md')
  return doc.gsub(/\.md/,'').gsub('docs/','').gsub(/(.*tutorial\/)([^.]*)\.(.*)/,'\1\3/\\2')
end

def version_for(doc)
  re = /en\/(.*?)\//
  version = doc.match re
  if !version.nil? && !version.captures.nil?
    return version.captures[0]
  else
    return '4.0.0'
  end
end

def category_for(doc)
  
  reVersion = /en\/(.*?)\//
  reCat = /(.*?)\//
  doc = doc.gsub(reVersion,'')

  cat = doc.match reCat
  if !cat.nil? && !cat.captures.nil?
    return cat.captures[0]
  else
    return ''
  end
end

def index_variable_for(version)
  if version == 'edge'
    return 0
  end
  if version == '2.2.0'
    return 2.2
  end
  if version == '4.0.0'
    return 4.0
  end
  if version == '4.1.0'
    return 4.1
  end
end