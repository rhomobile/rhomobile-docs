desc 'imageVersion= location of images generate Launchpad HTMl from MD for EB'
task :lp_generate_html do
  lp_generate_html
end

desc 'publish Launchpad HTMl pass in user= password= ex: rake lp_publish_html user=abc password=abc123 [filelimit=true]'
task :lp_publish_html do
  if ENV['user'].nil? || ENV['password'].nil? || ENV['server'].nil?
  	puts "Wrong format: rake lp_publish_html user=abc password=abc123 server=uat or prod"
  else
	  lp_publish_html
  end
end


desc 'delete docs from LP'
task :lp_delete_docs do
  if ENV['user'].nil? || ENV['password'].nil? || ENV['server'].nil?
  	puts "Wrong format: rake lp_publish_html user=abc password=abc123 server=uat or prod"
  else
	  lp_delete_docs
  end
end

desc 'generate baseline mapping index file for Lp Url rewrite'
task :lp_generate_mapping_index do
  Launchpad.generate_mapping_index
end

desc 'JSON to go in Lp theme child-sharedvars.ftl EMDKContent'
task :lp_generate_theme_content_json do
  if ENV['server'].nil?
    puts "Wrong format: rake lp_generate_theme_content_json server=uat or prod"
  else
    $stdout.sync = true
    env = ENV['server']
    # Get Mapping File
    if File.file?("#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}")
      # Open mapping file that has a string in Ruby hash format
      # this object will be used to hold id/urls of documents created
      url_map = eval(File.read("#{AppConfig['launchpad_eb']}#{AppConfig['launchpad_eb_mapping']}"))
      # puts url_map
      url_map.each do |key,item|
        lpid = key.gsub('/','')
        lpid = lpid.gsub('-','')
        
        lpurl = item['url'][env]
        puts "\"#{lpid}\":\"#{lpurl}\","
      end
    else
      puts 'ERROR No Mapping File Exists - run rake lp_generate_mapping_index to generate a baseline'
    end

  end
end

desc 'JSON to go in Lp theme child-sharedvars.ftl EMDKContent'
task :lp_generate_api_theme_content_json do
  apiMD = File.join(AppConfig['api_eb'],"**","*.md")
  apiFiles = Dir.glob(apiMD)
  apiFiles.each do |fileName|
    basename = fileName.gsub(AppConfig['api_eb'],'').gsub('.md','')
      puts "{"
      puts '"urlProp":"${ebContent.api' + basename + '}",'
      puts '"displayNameProp":"'+  basename + '",'
      puts '"iconProp" : "", ' 
      puts '"iconPropSm" : "",  '
      puts '"descProp" : ""'
      puts '},'
    
  end

end

