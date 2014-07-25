desc 'Look for broken links offline'
task :check_links do
  dir = File.absolute_path('.')
  files = Dir['**/*.md']
  @local_links         = {}
  @web_links           = {}
  @broken_local_links  = {}
  @broken_web_links    = {}
  @results_text        = ''

  # Iterate through .md files
  files.each do |file|
    get_links file
  end

  # Verify existence of local links found through get_links
  test_links

  # Display broken links in terminal
  print_broken_local_links

  # TODO Test Web Links

  # Format stats text
  format_stats_text

  puts @total_local_links + @broken_local_links_color + @percent_up

  @results_text << @total_local_links_no_color + @broken_local_links_no_color + @percent_up_no_color

  # Print results to file
  File.open('./broken_link_results.txt', 'w') {|f| f.write(@results_text) }
end

# Helpers for broken link checker
def get_links(file)
  web_links_arry    = []
  local_links_array = []

  path = File.absolute_path(File.dirname(file))
  # Get lines in file that have MD style links
  File.readlines(file).each do |line|
    line.to_s
    line.scan(/\[.*?\]\((.*?#?.?)\)/).each do |item|
      # Flatten and stringify arrays
      if item.class == Array
        if item.length == 1
          item = item[0].to_s
        else
          item = item.flatten.join("").to_s
        end
      end

      # Remove strings following anchor hashes (#)
      if item.include? '#'
        item = item.match(/(.*?)#+/)[0].chomp('#')
      end

      # Add web links to their own array
      if item.include?("http:") or item.include?("https:")
        web_links_arry << "#{path}/#{item}.md" unless web_links_arry.include? "#{path}/#{item}.md"
        next
      elsif item.empty? or item.include?("mailto:")
        next
      else
        # Add local links to their own array
        local_links_array << "#{path}/#{item}.md" unless local_links_array.include? "#{path}/#{item}.md"
      end
    end
  end
  @web_links[file] = web_links_arry
  @local_links[file] = local_links_array
end

def test_links
  @local_links.each do |file, links|
    broken_links = []
    links.each do |link|
      if !test_link(file, link)
        broken_links << link
      end
    end
    if broken_links.length > 0
      @broken_local_links[file] = broken_links
    end
  end
end

def print_broken_local_links
  if @broken_local_links.length != 0
    @broken_local_links.each do |file, links|
      puts green("File: #{file} - #{links.length} broken link(s)")
      @results_text << "File: #{file} - #{links.length} broken link(s)\n"
      if @broken_local_links[file]
        @broken_local_links[file].each do |link|
          puts red("\tLink: #{link}")
          @results_text << "\tLink: #{link}\n"
        end
      end
      puts "\n"
      @results_text << "\n"
    end
  end
end

def format_stats_text
  percent_unbroken = 100 - ((@broken_local_links.length * 100) / @local_links.length)
  if percent_unbroken.ord > 95
    @percent_up          = "Local Links up %:   #{green("#{percent_unbroken}%")}"
    @percent_up_no_color = "Local Links up %:   #{percent_unbroken}%"
  elsif percent_unbroken.ord < 95 and percent_unbroken > 80
    @percent_up          = "Local Links up %:   #{yellow("#{percent_unbroken}%")}"
    @percent_up_no_color = "Local Links up %:   #{percent_unbroken}%"
  else
    @percent_up          = "Local Links up %:   #{red("#{percent_unbroken}%")}"
    @percent_up_no_color = "Local Links up %:   #{percent_unbroken}%"
  end

  if @broken_local_links.length == 0
    @broken_local_links_color    = "Broken Local Links: #{green(@broken_local_links.length)}\n"
    @broken_local_links_no_color = "Broken Local Links: #{@broken_local_links.length}\n"
  else
    @broken_local_links_color    = "Broken Local Links: #{red(@broken_local_links.length)}\n"
    @broken_local_links_no_color = "Broken Local Links: #{@broken_local_links.length}\n"
  end
  @total_local_links          = "Total Local Links:  #{green(@local_links.length)}\n"
  @total_local_links_no_color = "Total Local Links:  #{@local_links.length}\n"
end

def test_link(file, link)
  File.exists?(link)
end