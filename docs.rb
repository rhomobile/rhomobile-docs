require 'rubygems'
require 'sinatra'
require 'rdiscount'

set :app_file, __FILE__

get '/README' do
  render_topic './README'
end

get '/' do
  cache_long
  render_topic 'index'
end

get '/:topic' do
  cache_long
  render_topic params[:topic]
end

helpers do
  def render_topic(topic)
    source = File.read(topic_file(topic))
    @content = markdown(source)
    @title, @content = title(@content)
    @toc, @content = toc(@content)
    @topic = topic
    erb :topic
  end

  def cache_long
    response['Cache-Control'] = "public, max-age=#{60 * 60}" unless development?
  end

  def markdown(source)
    RDiscount.new(source, :smart).to_html
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
    [
      [ 'quickstart', 'Quickstart' ],
      [ 'heroku-command', 'Heroku command-line tool' ],
      [ 'git', 'Using Git' ],
      [ 'sharing', 'Sharing' ],
      [ 'console-rake', 'Console and rake' ],
      [ 'rack', 'Deploying Rack-based apps' ],
    ]
  end

  def next_section(current_slug)
    return sections.first if current_slug.nil?

    sections.each_with_index do |(slug, title), i|
      if current_slug == slug and i < sections.length-1
        return sections[i+1]
      end
    end
    nil
  end

  alias_method :h, :escape_html
end

# vim: set ts=2 sts=2 sw=2 expandtab
