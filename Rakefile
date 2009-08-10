desc 'Start a development server'
task :server do
	if which('shotgun')
		exec 'shotgun -O docs.rb'
	else
		warn 'warn: shotgun not installed; reloading is disabled.'
		exec 'ruby -rubygems docs.rb -p 9393'
	end
end

task :start => :server

def which(command)
	ENV['PATH'].
		split(':').
		map  { |p| "#{p}/#{command}" }.
		find { |p| File.executable?(p) }
end
