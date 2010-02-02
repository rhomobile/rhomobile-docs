require File.dirname(__FILE__) + '/vendor/gems/environment'
Bundler.require_env

require 'docs'

run Sinatra::Application
