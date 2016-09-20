desc 'Apply inline CSS styling to offline archive files'
task :process_archive do

  downloadedHTML = File.join("archive","**","*.html")
  puts "\nHighlighting unclickable links..."

  htmlFiles = Dir.glob(downloadedHTML)

  # Links that go to 127.0.0.1:9393 (where no server is running) get styled dark red
  # Links that go to external sites (may not be reachable if user is truly offline) get italics
  htmlFiles.each do |fileName|
    puts "Processing " + fileName
    fileContents = IO.read(fileName)
    fileContents.gsub!(/href="(http:\/\/127.0.0.1:9393\/.*?)"/) do |match|
      "style='color:darkred;cursor:pointer' title='" + $1 + " was unreachable'"
    end
    fileContents.gsub!(/href="http.*?"/) do |match|
      match + ' style="font-style:italic"'
    end
    File.open(fileName,"w") do |fd|
      fd.write(fileContents)
    end
  end
end