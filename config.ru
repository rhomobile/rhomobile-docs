require 'rubygems'
require 'bundler/setup'
require 'rack/rewrite'

require './environment'

use Rack::Rewrite do
	r301  %r{^/v/2.2$}, '/en/2.2.0/'
	r301  %r{^/v/edge$}, '/en/edge/home'
	r301  %r{^/v/2.2/(.*)/(.*)}, '/en/2.2.0/$1/$2'
	r301  %r{^/v/2.2/(.*)}, '/en/2.2.0/$1'
	r301  %r{^/api/(.*)}, '/en/4.0.0/api/$1'
	r301  %r{^/guide/(.*)}, '/en/4.0.0/guide/$1'
	r301  %r{^/rhoconnect/(.*)}, '/en/4.0.0/rhoconnect/$1'
	r301  %r{^/rhoconnectapi/(.*)}, '/en/4.0.0/rhoconnectapi/$1'
	r301  %r{^/rhoconnectjs/(.*)}, '/en/4.0.0/rhoconnectjs/$1'
	r301  %r{^/tutorial/(.*)}, '/en/4.0.0/tutorial/$1'
	r301  %r{^/$}, '/en/4.0.0/home'
	r301  $r{^/home/}, '/en/4.0.0/home'
end
run Docs.new
