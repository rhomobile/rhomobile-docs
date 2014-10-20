require 'bundler/setup'
require 'rack/rewrite'

require './version'
require './environment'

use Rack::Rewrite do
	r301  %r{^/home$}, "/en/#{Version::CURR_VERSION}/home"

	# Edgedocs redirect
	r301  %r{^(.*)},								"http://docs.rhomobile.com/en/edge/home", :host => "edgedocs.rhomobile.com"
	r301  %r{^/v/2.2$},							"/en/2.2.0/home"
	r301  %r{^/v/edge$},						"/en/#{Version::NEXT_VERSION}/home"
	r301  %r{^/v/2.2/(.*)/(.*)},		"/en/2.2.0/$1/$2"
	r301  %r{^/v/2.2/(.*)},					"/en/2.2.0/$1"
	r301  %r{^/api/(.*)}, 					"/en/#{Version::CURR_VERSION}/api/$1"
	r301  %r{^/guide/(.*)}, 				"/en/#{Version::CURR_VERSION}/guide/$1"
	r301  %r{^/rhodes/(.*)}, 				"/en/2.2.0/rhodes/$1"
	r301  %r{^/rhoelements/(.*)}, 	"/en/2.2.0/rhoelements/$1"
	r301  %r{^/rhoconnect/(.*)}, 		"/en/#{Version::CURR_VERSION}/rhoconnect/$1"
	r301  %r{^/rhoconnectapi/(.*)}, "/en/#{Version::CURR_VERSION}/rhoconnectapi/$1"
	r301  %r{^/rhoconnectjs/(.*)},  "/en/#{Version::CURR_VERSION}/rhoconnectjs/$1"
	r301  %r{^/tutorial/(.*)}, 			"/en/#{Version::CURR_VERSION}/tutorial/$1"
	r301  %r{^/$},									"/en/#{Version::CURR_VERSION}/home"

	# Static link redirects for latest version docs
	r301  %r{^/en/latest$},					 "/en/#{Version::CURR_VERSION}/home"
	r301  %r{^/en/latest/(.*)}, 		 "/en/#{Version::CURR_VERSION}/$1"
	r301  %r{^/en/latest/(.*)/(.*)}, "/en/#{Version::CURR_VERSION}/$1/$2"

	# Hosted Services Redirects
	r301  %r{^/en/hosted$},					"/en/hosted/guide/welcome"
	r301  %r{^/en/hosted/guide$},		"/en/hosted/guide/welcome"
	r301  %r{^/en/hosted/welcome$},	"/en/hosted/guide/welcome"
end
run Docs.new