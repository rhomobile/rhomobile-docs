require "rubygems"
require "bundler"
require 'yaml'

ENV["RACK_ENV"] ||= "development" unless ENV["RACK_ENV"]
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
AppConfig = YAML.load_file(File.join(File.dirname(__FILE__),'config.yml'))[ENV['RACK_ENV']]

require './docs'