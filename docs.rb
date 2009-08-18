require 'rubygems'
require 'sinatra'
require 'rdiscount'
require 'vendor/heroku_header'

set :app_file, __FILE__

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
  erb :search
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

before do
	@asset_host = ENV['ASSET_HOST']
end

helpers do
	def render_topic(topic)
		source = File.read(topic_file(topic))
		@topic = topic
		@content = markdown(source)
		@title, @content = title(@content)
		@toc, @content = toc(@content)
		if @toc.any?
			@intro, @body = @content.split('<h2>', 2)
			@body = "<h2>#{@body}"
		else
			@intro, @body = '', @content
		end
		erb :topic
	rescue Errno::ENOENT
		status 404
	end

	def cache_long
		response['Cache-Control'] = "public, max-age=#{60 * 60}" unless development?
	end

	def notes(source)
		source.gsub(
			/NOTE: (.*?)\n\n/m,
			"<table class='note'>\n<td class='icon'></td><td class='content'>\\1</td>\n</table>\n\n"
		)
	end

	def markdown(source)
		html = RDiscount.new(notes(source), :smart).to_html
		# parse custom {lang} definitions to support syntax highlighting
		html.gsub(/<pre><code>\{(\w+)\}/, '<pre><code class="brush: \1;">')
	end

	def topic_file(topic)
		if topic.include?('/')
			topic
		else
			"#{options.root}/docs/#{topic}.txt"
		end
	end

	def title(content)
		title = content.match(/<h1>(.*)<\/h1>/)[1]
		content_minus_title = content.gsub(/<h1>.*<\/h1>/, '')
		return title, content_minus_title
	end

	def slugify(title)
		title.downcase.gsub(/[^a-z0-9 -]/, '').gsub(/ /, '-')
	end

	def toc(content)
		toc = content.scan(/<h2>([^<]+)<\/h2>/m).to_a.map { |m| m.first }
		content_with_anchors = content.gsub(/(<h2>[^<]+<\/h2>)/m) do |m|
			"<a name=\"#{slugify(m.gsub(/<[^>]+>/, ''))}\"></a>#{m}"
		end
		return toc, content_with_anchors
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
