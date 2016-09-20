desc 'Check docs.rhomobile.com for broken links'
task :check_links do
  URI = "http://docs.rhomobile.com"
  OPTIONS = "--no-warnings --max-threads 400"

  def check_links
    @results = `check-links #{URI} #{OPTIONS}`
  end

  def parse_results
    @problems_array = []
    @stats = ""
    broken_links = ""
    problem = ""

    # Reduce results to JUST problems
    @results.each_line do |line|
      broken_links += line unless line.start_with?("Checked") or line.start_with?("Error:")
      @stats = line if line.start_with?("Checked ")
    end

    # Separate problems into elements in an array
    broken_links.each_line do |line|
      if !line.match(/^\s/) and !problem.empty?
        @problems_array << problem.to_s
        problem = ""
      end
      problem += line
    end

    # Remove problems referencing localhost
    # First gather a list of the localhost references
    localhost_references = []
    @problems_array.each do |problem|
      if problem.include?("localhost")
        localhost_references << problem
      end
    end

    # Then remove the elements containing the references to localhost
    localhost_references.each do |ref|
      @problems_array.delete(ref)
    end
  end

  check_links
  parse_results

  if !@problems_array.empty?
    puts @problems_array
    puts @stats
    ENV['BAD_LINKS_FOUND'] = "1"
  end
end