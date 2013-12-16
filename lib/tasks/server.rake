desc 'Start a development server'
task :server do
    process_xml
  if which('shotgun')
    exec 'shotgun -O config.ru'
  else
    warn 'warn: shotgun not installed; reloading is disabled.'
    exec 'rackup config.ru -p 9393'
  end
end