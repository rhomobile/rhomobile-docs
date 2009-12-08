require 'rubygems'
require 'sinatra'
require 'sunspot'
require 'topic'
require 'vendor/heroku_header'


set :app_file, __FILE__

Sunspot.config.solr.url = ENV["WEBSOLR_URL"]

configure :production do
	HerokuHeader.fetch_latest('docs')
end

not_found do
	erb :not_found
end

get '/' do
	cache_long
	render_topic 'index'
end

get '/search' do
  erb :search, :locals => {:search => search_for(params[:q])}
end

get '/getting-started' do
  redirect '/heroku'
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
	
	def search_for(query)
	  Sunspot.search(Topic) do
	    keywords(query) do
	      highlight :content
      end
	  end
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
