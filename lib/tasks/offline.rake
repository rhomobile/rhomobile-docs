desc 'generate offline json index file for offline search'
task :offline_index do
  Offline.generate_json_index
end

