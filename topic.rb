require 'rdiscount'
require './models'

class Topic
  
  def text_only
    @body = @body.gsub(/\<[^\<]+\>/,'')
    self
  end
  
  def self.load(topic, source)
    topic = new(topic, source)
    topic.parse
    return topic
  end
  
  def self.all_topics
    dirs = AppConfig['dirs'] || {}
    paths = dirs.values.map! { |path| path += "*.txt" }
    # puts paths
    paths <<'v/**/*.txt'
    FileList[paths]
  end
  
  attr_reader :topic, :title, :content, :toc, :toc_sub, :intro, :body
  
  def initialize(name, source)
    @topic = name
    @source = source
  end
  
  def parse
    @topic = topic
    @content = markdown(source)
    @title, @content = _title(@content)
    @toc, @content = _toc(@content)
    @toc_sub, @content = _tocSub(@content)
    
    if @toc.any?
      @intro, @body = @content.split('<h2>', 2)
      @body = "<h2>#{@body}"
    else
      @intro, @body = '', @content
    end
  end
  
  protected
  
  def source
    @source
  end
  
  def notes(source)
		# source.gsub(
		# 	/NOTE: (.*?)\n\n/m,
		# 	"<table class='note'>\n<td class='icon'></td><td class='content'>\\1</td>\n</table>\n\n"
		# )
    source.gsub(
          /NOTE: (.*?)\n\n/m,
          "<div class='alert alert-warning'><table>\n<td ><i class='icon-warning-sign icon-2x'></i></td><td >\\1</td>\n</table></div>\n\n"
        )
	end
	
	def markdown(source)
		html = RDiscount.new(notes(source), :smart).to_html
		# parse custom {lang} definitions to support syntax highlighting
		html.gsub(/<pre><code>\{(\w+)\}/, '<pre><code class="brush: \1;">')
	end

	def _title(content)
		title = content.match(/<h1>(.*)<\/h1>/)[1]
		content_minus_title = content.gsub(/<h1>.*<\/h1>/, '')
		return title, content_minus_title
	end

	def slugify(title)
		title.downcase.gsub(/[^a-z0-9 -]/, '').gsub(/ /, '-')
	end

	def _toc(content)
		toc = content.scan(/<h2>([^<]+)<\/h2>/m).to_a.map { |m| m.first }
		content_with_anchors = content.gsub(/(<h2>[^<]+<\/h2>)/m) do |m|
			"<a name=\"#{slugify(m.gsub(/<[^>]+>/, ''))}\"></a>#{m}"
		end
		return toc, content_with_anchors
	end

  def _tocSub(content)
    toc = []
    content.scan(/<h3 data-h2="([^<]+)">([^<]+)<\/h3>/m).each {|m|
      hash = { "h2" => m[0], "h3" => m[1] }
      toc.push(hash)
  
    } #.to_a #.map #{ |m| m.first }
    # puts toc
    content_with_anchors = content.gsub(/(<h3 data-h2="([^<]+)">[^<]+<\/h3>)/m) do |m|
      "<a name=\"#{slugify(m.gsub(/<[^>]+>/, ''))}\"></a>#{m}"
    end
    return toc, content_with_anchors
  end

  def self.model(topicfile)
    model = nil
    model = Models.docmodel(topicfile)
    
    
    return model 
  end 
	
end
