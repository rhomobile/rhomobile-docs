desc 'test'
task :index_test do
  Topic.all_topics.each do |doc|
    puts doc
    rest_result = RestClient.get("https://api.github.com/repos/rhomobile/rhomobile-docs/commits?path=#{doc}", :Authorization => 'token ea72876766af0098ab690afc067c315107b5019f').body
  
    if rest_result.code != 200
      puts ('Error communication with site')
      parsed = JSON.parse(rest_result)
      puts parsed["message"]
    else
       parsed = JSON.parse(rest_result)
       last_commit = DateTime.parse(parsed[0]['commit']['committer']['date']).strftime('%s')
       puts last_commit
    end  
  end
  puts "finished indexing"
end