class PdfMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    
    if env["REQUEST_URI"] =~ /.pdf$/
      # If the page ends in ".pdf", render it as a PDF. Otherwise, don't do anything with it.
      
      content = response.join("")

      # Replace relative links with absolute links
      # First, regex for all a href elements
      content.gsub!(/<a href="(.*?)">(.*?)<\/a>/) do |match|
        url = $1
        text = $2
        
        # If there's no colon in the URL, then assume it's a relative link, and make it absolute
        if !(url.include? ":")
          if !( url =~ /^\// )
            url = "/"+url
          end
          
          '<a href="http://'+ env["HTTP_HOST"] + url.to_s + '" style="font-style:italic">' + text.to_s + '</a>'
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