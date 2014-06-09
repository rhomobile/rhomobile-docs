desc 'generate Launchpad HTMl from MD for EB'
task :lp_generate_html do
  lp_generate_html
end

desc 'publish Launchpad HTMl pass in user= password= ex: rake lp_publish_html user=abc password=abc123 '
task :lp_publish_html do
  if ENV['user'].nil? || ENV['password'].nil?
  	puts "Wrong format: rake lp_publish_html user=abc password=abc123"
  else
	  lp_publish_html
  end
end


desc 'delete docs from LP'
task :lp_delete_docs do
  if ENV['user'].nil? || ENV['password'].nil?
  	puts "Wrong format: rake lp_publish_html user=abc password=abc123"
  else
	  lp_delete_docs
  end
end

desc 'generate baseline mapping index file for Lp Url rewrite'
task :lp_generate_mapping_index do
  Launchpad.generate_mapping_index
end