class PdfMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    
    if env["REQUEST_URI"] =~ /.pdf$/
      puts "MAKING PDF NOW"
      
      content = response.join("")

      content.gsub!(/<a href="(.*?)">(.*?)<\/a>/) do |match|
        #match + ' style="font-style:italic"'
        url = $1
        text = $2
        
        if !(url.include? ":")
          puts "No colon link: " + match
          puts "url is #{url} and text is #{text}"
          
          if !( url =~ /^\// )
            url = "/"+url
          end
          
          '<a href="http://'+ env["HTTP_HOST"] + url.to_s + '" style="font-style:italic">' + text.to_s + '</a>'
        else
          puts "Colon link: " + match
          match
        end
      end

    
      kit = PDFKit.new(content)

      kit.stylesheets << File.join( File.dirname(__FILE__), 'public', 'stylesheets', 'pdf.css').to_s
      kit.stylesheets << File.join( File.dirname(__FILE__), 'public', 'stylesheets', 'coderay.css').to_s
      kit.stylesheets << File.join( File.dirname(__FILE__), 'public', 'stylesheets', 'fontface.css').to_s
      
      body = kit.to_pdf

      response = [body]
      headers["Content-Length"] = (body.respond_to?(:bytesize) ? body.bytesize : body.size).to_s
      headers["Content-Type"] = "application/pdf"
    end
    
    [status, headers, response]
  end
end