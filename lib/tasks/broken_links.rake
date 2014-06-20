desc 'Look for broken links offline'
task :check_links do
  dir = '/Users/michaeltoews/repos/rhomobile-docs/docs'
  files = Dir['**/*.md']

  files.each do |file|
    get_links file
  end
end