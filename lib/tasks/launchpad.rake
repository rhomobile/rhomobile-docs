desc 'generate Launchpad HTMl from MD for EB'
task :lp_generate_html do
  lp_generate_html
end

desc 'publish Launchpad HTMl from MD for EB'
task :lp_publish_html do
  lp_publish_html
end

desc 'generate baseline mapping index file for Lp Url rewrite'
task :lp_generate_mapping_index do
  Launchpad.generate_mapping_index
end