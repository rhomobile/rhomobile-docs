require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "cloudquery"
    gem.summary = "Client for Xoopit's cloudquery API"
    gem.email = "us@nb.io"
    gem.homepage = "http://github.com/nbio/cloudquery"
    gem.description = "Client for Xoopit's cloudquery API"
    gem.authors = ["Cameron Walters", "nb.io"]
    gem.files =  FileList["[A-Z]*", "{lib,spec}/**/*"] 
    # gem.rubyforge_project = "cloudquery"
    gem.add_dependency('rack', ">= 1.0")
    gem.add_dependency('json', ">= 1.1.4")
    gem.add_dependency('taf2-curb', ">= 0.2.8.0")
    
    
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end


task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cloudquery #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# begin
#   require 'rake/contrib/sshpublisher'
#   namespace :rubyforge do
#     
#     desc "Release gem and RDoc documentation to RubyForge"
#     task :release => ["rubyforge:release:gem", "rubyforge:release:docs"]
#     
#     namespace :release do
#       desc "Publish RDoc to RubyForge."
#       task :docs => [:rdoc] do
#         config = YAML.load(
#             File.read(File.expand_path('~/.rubyforge/user-config.yml'))
#         )
# 
#         host = "#{config['username']}@rubyforge.org"
#         remote_dir = "/var/www/gforge-projects/cloudquery/"
#         local_dir = 'rdoc'
# 
#         Rake::SshDirPublisher.new(host, remote_dir, local_dir).upload
#       end
#     end
#   end
# rescue LoadError
#   puts "Rake SshDirPublisher is unavailable or your rubyforge environment is not configured."
# end
