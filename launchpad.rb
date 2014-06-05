require 'xmlsimple'
require 'rdiscount'
require 'rest-client'
require 'json'
class Launchpad
	@my_server = 'developer-uat.motorolasolutions.com/api/core/v3'
	@my_user = 'emdk'
	@my_pass = 'emdk1234'

  def self.generate_html(topic)
		#open Markdown content
		md = File.read(topic)
		
		#pre-pend LP specific code
		html = "<div class='tableofcontents'> </div>" 

		# Add Markdown converted to HTML
  		html += RDiscount.new(md, :smart).to_html 	

  		# Reformat code blocks
  		html = html.gsub(/<pre><code>(.*?)<\/code><\/pre>/m) do |m|
      		 m.gsub("<pre><code>","<pre class=\"jive_text_macro jive_macro_code\" jivemacro=\"code\" ___default_attr=\"javascript\" _jivemacro_uid=\"_1398870592774641\">").gsub("</code></pre>","</pre>")
    	end
  		
  		# reformat image links

  		# write html file
  		basename = topic.gsub(AppConfig['api_eb'],'')
    	outputfile = "#{AppConfig['launchpad_eb']}#{basename.gsub!('.md','.html')}"
	  	File.open("#{outputfile}", 'w') {|f| 
	  		f.write(html) 
	  	}
	
  end

  def self.publish_html(topic)

  	# read file contents
  	html = File.read(topic)
  	subject = 'APi Doc Test From Ruby'
  	# need to get parent for UAT or Production
  	parent = 'https://developer-uat.motorolasolutions.com/api/core/v3/places/18095'
  	
  	# Jive V3 Endpoint
  	endpoint = '/contents'

	# create REST JSON Body		
  	jdata = {
  		:visibility => 'place',
  		:subject => subject,
  		:content => {
  			:type => 'text/html',
  			:text => html
  			},
  		:type => 'document',
  		:parent => parent
  		}.to_json
  	begin
  		# Create Doc
		response = RestClient::Request.execute :method=> :post, :url => "https://#{@my_user}:#{@my_pass}@#{@my_server}#{endpoint}", 
		:headers => {'Content-Type' => 'application/json'}, 
		:payload => jdata 

  		#response.code = 201 is success, else parsed.message = error message, parsed.code
		parsed = JSON.parse(response)
		@documentId = parsed["id"]
		puts "Success: ID => #{@documentId}"
	rescue => e
	  puts "The request failed with HTTP status code #{e.response.code}"
	  puts "The body was:"
	  puts e
	end
  end
end
