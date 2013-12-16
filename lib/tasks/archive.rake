desc 'Create offline archive'
task :archive do
  serverpid = Process.fork { Rake::Task['server'].invoke }

  puts "Waiting 3 seconds for server to start..."
  sleep 3

  `wget -mirror -k -E -nH -nv -P archive http://127.0.0.1:9393/`
  puts "Mirroring complete. Killing server."
  
  Process.kill(9,serverpid)
  Rake::Task['process_archive'].invoke

  puts "Done"
end