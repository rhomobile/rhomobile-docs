desc 'Look for broken links offline'
task :check_links do
  dir = '/Users/michaeltoews/repos/rhomobile-docs/docs'
  files = Dir['**/*.md']
  @local_links         = {}
  @web_links           = {}
  @broken_local_links  = {}
  @broken_web_links    = {}

  # Iterate through .md files
  files.each do |file|
    get_links file
  end

  # Verify existence of local links found through get_links
  @local_links.each do |file, links|
    broken_links = []
    links.each do |link|
      if !test_link(file, link)
        broken_links << link
      end
    end
    if broken_links.length > 0
      puts broken_links
      @broken_local_links[file] = broken_links
    end
  end

  # if @broken_local_links.length != 0
  #   @broken_local_links.each do |file|
  #     puts file
  #     if @broken_local_links[file]
  #       @broken_local_links[file].each do |link|
  #         puts "\t#{link}"
  #       end
  #     end
  #   end
  # end

  puts "Broken Links: #{@broken_local_links.length}\n" +
       "Total Links:  #{@local_links.length}"
  # Calculate %broken
  # percent_local_broken = (@broken_local_links.length * 100) / @local_links.length
end