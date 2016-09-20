desc 'Remove the current docs index'
task :remove_index do
  require 'indextank'

  puts "Removing current Index..."

  client = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'])
  index = client.indexes(AppConfig['index'])
  puts "Deleting Index"
  index.delete rescue nil

  # Add necessary attributes to searchify index
  # Make search public
  puts "Make search public..."
  index.add :public_search => true

  # Make sure the index is created and running
  while not index.running?
    sleep 0.5
    print '.'
  end
  print "\n"

  # Add custom search scoring.
  puts "Add custom search scoring..."
  index.functions(0, "doc.var[0] + relevance").add
  index.functions(1, "-age").add
end