desc 'Sample search'
task :search, :query do |t, args|
  client = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'])
  index = client.indexes(AppConfig['index'])

  results = index.search(args[:query], :fetch => 'title,dockey,docexternal', :snippet => 'text')
  puts "#{results['matches']} results."
  puts results.inspect
end