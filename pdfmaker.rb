class PdfMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    
    if env["REQUEST_URI"] =~ /.pdf$/
      # If the page ends in ".pdf", render it as a PDF. Otherwise, don't do anything with it.
      
      content = response.join("")

      # Perform regexes to transform content to make it more PDFKit-riendly

      # Replace note elements with actual note icons, since PDFKit won't render background images as
      # defined in external CSS files
      content.gsub!(/<td class="icon"><\/td>/) do |match|
        "<td class=\"icon\"><img src=\"/images/note.png\"></td>"
      end

      # Use regexes to replace relative links/images with fully qualified links/images
      # Otherwise, PDF will try to link to file:// and images will be broken
      content.gsub!(/<(a href|img src)="(.*?)">(.*?)(?:<\/a>|)/) do |match|
        type = $1
        url = $2
        text = $3
        
        # If there's no colon in the URL, then assume it's a relative link, and make it absolute
        if !(url.include? ":")
          #puts "Subbing for " + type + " " + url
          if !( url =~ /^\// )
            url = "/"+url
          end
          
          '<'+type+'="http://'+ env["HTTP_HOST"] + url.to_s + '" style="font-style:italic">' + text.to_s + '</a>'
        else
          # Colon in the URL, leave it as is (ftp, http, mailto...)
          match
        end
      end

      # Create a PDFKit object, apply some CSS to it
      kit = PDFKit.new(content)

      kit.stylesheets << File.join( File.dirname(__FILE__), 'public', 'stylesheets', 'pdf.css').to_s
      kit.stylesheets << File.join( File.dirname(__FILE__), 'public', 'stylesheets', 'coderay.css').to_s
      kit.stylesheets << File.join( File.dirname(__FILE__), 'public', 'stylesheets', 'fontface.css').to_s
      
      body = kit.to_pdf

      response = [body]

      headers["Content-Type"] = "application/pdf"
      headers["Content-Length"] = (body.respond_to?(:bytesize) ? body.bytesize : body.size).to_s
    end
    
    [status, headers, response]
  end
end