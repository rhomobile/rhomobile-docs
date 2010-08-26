require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'indextank'
require 'topic'

require 'heroku/nav'
use Heroku::Nav::Internal
use Heroku::Nav::Header
use Heroku::Nav::Internal

# require 'rack/coderay'
# use Rack::Coderay, "//pre[@lang]>code"

require 'coderay'
require './lib/term.rb'
require 'rack/codehighlighter'
use Rack::Codehighlighter, :coderay, :markdown => true, :element => "pre>code", :pattern => /\A:::(\w+)\s*(\n|&#x000A;)/i, :logging => false

configure :production do
    ENV['APP_ROOT'] ||= File.dirname(__FILE__)
    $:.unshift "#{ENV['APP_ROOT']}/vendor/plugins/newrelic_rpm/lib"
    require 'newrelic_rpm'
end

$LOAD_PATH << File.dirname(__FILE__) + '/lib'

set :app_file, __FILE__

not_found do
	erb :not_found
end

# REDIRECTS

get '/getting-started' do
  redirect '/heroku'
end

get '/memcached' do
  redirect '/memcache'
end

get '/technologies' do
  redirect '/aspen'
end

# 

get '/' do
	cache_long
	haml :index
end

get '/search' do
  page = params[:page].to_i
  search, prev_page, next_page = search_for(params[:q], page)
  erb :search, :locals => {:search => search, :query => params[:q], :prev_page => prev_page, :next_page => next_page}
end

get '/:topic' do
	cache_long
	render_topic params[:topic]
end

get '/css/docs.css' do
	cache_long
	content_type 'text/css'
	erb :css, :layout => false
end

helpers do
	def render_topic(topic)
		source = File.read(topic_file(topic))
		@topic = Topic.load(topic, source)
		
		@title   = @topic.title
		@content = @topic.content
		@intro   = @topic.intro
		@toc     = @topic.toc
		@body    = @topic.body
		
		erb :topic
	rescue Errno::ENOENT
		status 404
	end
	
	def search_for(query, page = 0)
    client = IndexTank::Client.new(ENV['HEROKUTANK_API_URL'])
    index = client.indexes('heroku-docs')
    search = index.search(query, :start => page * 10, :len => 10, :fetch => 'title', :snippet => 'text')
    next_page =
      if search['matches'] > (page + 1) * 10
        page + 1
      end
    prev_page =
      if page > 0
        page - 1
      end

    [search, prev_page, next_page]
	end
	
	def topic_file(topic)
		if topic.include?('/')
			topic
		else
			"#{options.root}/docs/#{topic}.txt"
		end
	end

	def cache_long
		response['Cache-Control'] = "public, max-age=#{60 * 60}" unless development?
	end

	def slugify(title)
		title.downcase.gsub(/[^a-z0-9 -]/, '').gsub(/ /, '-')
	end

	def sections
		TOC.sections
	end

	def next_section(current_slug, root=sections)
		return sections.first if current_slug.nil?
		root.each_with_index do |(slug, title, topics), i|
			if current_slug == slug and i < root.length-1
				return root[i+1]
			elsif topics.any?
				res = next_section(current_slug, topics)
				return res if res
			end
		end
		nil
	end

	alias_method :h, :escape_html
end

module TOC
	extend self

	def sections
		@sections ||= []
	end

	# define a section
	def section(name, title)
		sections << [name, title, []]
		yield if block_given?
	end

	# define a topic
	def topic(name, title)
		sections.last.last << [name, title, []]
	end

	file = File.dirname(__FILE__) + '/toc.rb'
	eval File.read(file), binding, file
end
