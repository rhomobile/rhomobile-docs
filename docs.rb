require 'rubygems'
require 'sinatra'
require 'rdiscount'

set :app_file, __FILE__

get '/README' do
  render_topic './README'
end

get '/' do
  cache_long
  @title = 'Documentation'
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
    @title ||= @content.match(/<h1>(.*)<\/h1>/)[1]
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

  alias_method :h, :escape_html
end

# vim: set ts=2 sts=2 sw=2 expandtab
