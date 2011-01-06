require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'indextank'
require 'topic'

unless development?
  require 'rhomobile/nav'
  use Rhomobile::Nav::Base, {
    :nav_host => "#{AppConfig['rhonav_host']}/#{ENV["RACK_ENV"]}",
    :blog => true, :subscribe => false, :support => false
  }
end

require 'coderay'
require './lib/term.rb'
require 'rack/codehighlighter'
use Rack::Codehighlighter, :coderay, :markdown => true, :element => "pre>code", 
  :pattern => /\A:::(\w+)\s*(\n|&#x000A;)/i, :logging => false

$LOAD_PATH << File.dirname(__FILE__) + '/lib'

set :app_file, __FILE__

not_found do
	erb :not_found
end

['/', '/home'].each do |path|
  get path do
	  cache_long
  	haml :index
	end
end

get '/search' do
  page = params[:page].to_i
  search, prev_page, next_page = search_for(params[:q], page)
  erb :search, :locals => {:search => search, :query => params[:q], :prev_page => prev_page, :next_page => next_page}
end

get '/css/docs.css' do
	cache_long
	content_type 'text/css'
	erb :css, :layout => false
end

#get '/:topic' do
# TODO: use proper regex
['/:topic/?', '/:subpath/:topic/?'].each do |path|
  get path do
	  cache_long
	  render_topic params[:topic], params[:subpath]
  end
end

helpers do
	def render_topic(topic, subpath = nil)
		source = File.read(topic_file(topic, subpath))
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
    index = client.indexes(AppConfig['index'])
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
	
	def topic_file(topic, subpath = nil)
	  if topic.include?('/')
	    topic
		elsif subpath
		  File.join(AppConfig['dirs'][subpath], "#{topic}.txt")
		else
			"#{options.root}/docs/#{topic}.txt"
		end
	end
	
	def topic_path
	  params[:subpath] ? [params[:subpath],params[:topic]].join('/') : params[:topic]
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
