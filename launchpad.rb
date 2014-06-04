require 'xmlsimple'
require 'rdiscount'

class Launchpad

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

end
