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

  		# reformat image links

  		# write html file
  		basename = topic.gsub(AppConfig['api_eb'],'')
    	outputfile = "#{AppConfig['launchpad_eb']}#{basename.gsub!('.md','.html')}"
	  	File.open("#{outputfile}", 'w') {|f| 
	  		f.write(html) 
	  	}
	
  end

end
