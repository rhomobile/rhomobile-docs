require 'rest_client'

module HerokuHeader
	extend self

	def fetch_latest
		@header = RestClient::Resource.new("#{heroku_domain}/shared/header", 'internal', 'MN2q0tzjj30KlsnfT').get rescue nil
	end

	def show
		@header || default
	end

	def default
		"
		<style type='text/css'>
			#header {
				height: 87px;
				background: url(http://#{heroku_domain}/images/v2/header-no-shadow.png);
				font-size: 16px;
			}
			#logo {
				margin: 17px 0 0 25px;
				float: left;
				text-indent: -9999px;
				width: 177px;
				height: 56px;
				overflow: hidden;
				background: url(http://#{heroku_domain}/images/v2/logo.png) no-repeat;
			}
		</style>
		<div id='header'>
			<a id='logo' href='http://heroku.com/'>Heroku</a>
			<div id='nav'>
			</div>
		</div>
		"
	end

	def heroku_domain
		ENV['HEROKU_HOST'] || "heroku.com"
	end
end
