require 'xmlsimple'
require 'rdiscount'

class Api


#returns markdown for the name of the API 
  def self.getApiName(doc)
  	md=""
  	md = doc["MODULE"][0]["name"]
  	# doc.elements.each("//MODULE") { |element| 
  	# 	md = element.attributes["name"] 
  	# }
  	return md
  end
 
 def self.getApiDesc(doc)
  	md=""
  	if !doc["MODULE"][0]["HELP_OVERVIEW"][0].nil? && doc["MODULE"][0]["HELP_OVERVIEW"][0].length >0

	  	md = doc["MODULE"][0]["HELP_OVERVIEW"][0]
  	end
  	#md += "\n\n" + doc["MODULE"][0]["MORE_HELP"][0]
  	# doc.elements.each("//MODULE") { |element| 
  	# 	md = element.attributes["name"] 
  	# }
  	#puts md
  	return md
  end
 
  def self.getpropusagetext(model,property,type,ro,propbag)
  	defval = ''
  	if type == 'STRING'
  		defval = "'some string'"
  	end
  	if type == 'BOOLEAN'
  		defval = "true"
  	end
  	if type == 'INTEGER'
  		defval = "0"
  	end
  	if type == 'FLOAT'
  		defval = "1.0"
  	end
	if ro.nil?
		readonly = false
	else
		if ro=="true"
			readonly = true
		else
			readonly = false
		end
	end

  	md = "\n\n<strong>Ruby Usage</strong>"
  	md += "\n\n<pre class='CodeRay'><code>:::ruby\n"
  	if !ro
	  	md += "# Setting directly"
	  	md += "\n"
	  	md += "#{model}.#{property}=#{defval}"
	  	if propbag
		  	md += "\n# Setting one property"
		  	md += "\n"
		  	md += "#{model}.setProperty " + ":#{property}, #{defval} "
		  	md += "\n# Setting multiple properties using HASH"
		  	md += "\n"
	  		md += "#{model}.setProperties { " + ":#{property} => #{defval} , :another_property => #{defval}}"
  		end
  	end
  	if propbag
	  	md += "\n\n# Getting one property"
	  	md += "\n"
	  	md += "myvar = #{model}.getProperty(" + "'#{property}')"
	  	md += "\n# Getting multiple properties"
	  	md += "\n"
	  	md += "myvar = #{model}.getProperties([" + "'#{property}' , 'another_property'])"
  	end
  	md += "</code></pre>" 
  	md += "\n\n<strong>Javascript Usage</strong>"
  	md += "\n\n<pre class='CodeRay'><code>:::javascript\n"
  	if !ro
	  	md += "\n# Setting directly"
	  	md += "\n"
	  	md += "#{model}.#{property}=#{defval};"
	  	if propbag
		  	md += "\n# Setting one property"
		  	md += "\n"
		  	md += "#{model}.setProperty(" + "'#{property}',#{defval});"
		  	md += "\n# Setting multiple properties using JSON object"
		  	md += "\n"
		  	md += "#{model}.setProperties({ " + ":#{property}:#{defval} , :another_property:#{defval}});"
		end
  	end 
  	if propbag
	  	md += "\n\n# Getting one property"
	  	md += "\n"
	  	md += "myvar = #{model}.getProperty(" + "'#{property}');"
	  	md += "\n# Getting multiple properties"
	  	md += "\n"
	  	md += "myvar = #{model}.getProperties([" + "'#{property}' , 'another_property']);"
	end
	md += "</code></pre>" 
  	
  	return md
  end

  def self.getexamplelinks(doc)
  	md = ""
  	if !doc["MODULE"][0]["EXAMPLES"].nil?
	  	s=doc["MODULE"][0]["EXAMPLES"][0]["EXAMPLE"]
	  	s.each_with_index() { |element,index|
	  	md += '<li><a href="#e' + index.to_s + '" data-target="eExample' + index.to_s + '" class="autouncollapse">' + element['title'] + "</a></li>" 
		}
  	end
  	return md
  end

  def self.getremarklinks(doc)
  	md = ""
  	if !doc["MODULE"][0]["REMARKS"].nil?
	  	s=doc["MODULE"][0]["REMARKS"][0]["REMARK"]
	  	s.each_with_index() { |element,index|
	  	md += '<li><a href="#r' + index.to_s + '" data-target="rRemark' + index.to_s + '" class="autouncollapse">' + element['title'] + "</a></li>" 
		}
  	end
  	return md
  end


  def self.getpropertieslinks(doc)
  	md = ""
  	if !doc["MODULE"][0]["PROPERTIES"].nil?
	  	s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}
	  	s.each() { |element|
		propreplaces = ""
		#puts doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0].empty?
		#Check to see if need to add to description about this method replacing a deprecated one
		if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"].nil?  && !doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0].empty?
	    	doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0]["ALIAS"].each() { |a|
				#puts a
				if a["existing"] == element["name"]
					propreplaces += a["new"]
				end
			}
		end
		
	  	propdisplayname = element["name"]
	  	if propreplaces != ""
				#methname = methname + " <span class='pull-right label label-info'>Replaces:#{methreplaces}</span>"
				# @methdesc = " <span class='label label-info'>Replaces:#{methreplaces}</span>" + @methdesc
				propdisplayname = '<span class="text-info">' + element["name"] + '</span>'

		end

	  		md += '<li><a href="#p' + element["name"] + '" data-target="cProperty' + element["name"] + '" class="autouncollapse">' + propdisplayname + "</a></li>" 
		}
  	end
  	return md
  end

  def self.getmethodslinks(doc)
  	md = ""
  	if !doc["MODULE"][0]["METHODS"].nil?
	  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]}
	  	s.each() { |element|
  			methname = element["name"]

	  		if !doc["MODULE"][0]["METHODS"].nil? && !doc["MODULE"][0]["METHODS"][0]["ALIASES"].nil?  && !doc["MODULE"][0]["METHODS"][0]["ALIASES"][0].empty?
	    	doc["MODULE"][0]["METHODS"][0]["ALIASES"][0]["ALIAS"].each() { |a|
				#puts a
				if a["existing"] == element["name"]
					methname = "<span class='text-info'>" + element["name"] + "</span>"
	  			end
			}
			end
	  		methdeprecated = ""
			if !element["deprecated"].nil?
				methdeprecated = element["deprecated"]
			end
	  		if methdeprecated == "true"
	  			methname = "<span class='text-error'>" + element["name"] + "</span>"
			end
			
	  		md += '<li><a href="#m' + element["name"] + '" data-target="cMethod' + element["name"] + '" class="autouncollapse">' + methname + "</a></li>" 
		}
  	end
  	return md
  end

  def self.getexamples(doc)
  	md = ""
  	# puts doc["MODULE"][0]["EXAMPLES"]
  	if !doc["MODULE"][0]["EXAMPLES"].nil?
	  	s=doc["MODULE"][0]["EXAMPLES"][0]["EXAMPLE"]
	  	s.each_with_index() { |element,index|
	  		examplename = ""
  			examplesections = ""
	  		examplename = element["title"]
	  		sect=element["SECTIONS"][0]["SECTION"]
	  		sect.each() { |section|
	  			#puts "**********"
	  			#puts section
	  			examplesections += "\n"
	  			examplesections += section["DESC"][0]
	  			codelang = 'ruby'
	  			codesnip = section["CODE"]
	  			 # puts codesnip
	  			 if !codesnip[0]["lang"].nil?
	  			 	codelang = codesnip[0]["lang"]
	  			 	if codelang.empty?
	  			 		codelang = 'ruby'
	  			 	end
	  			 end
	  			examplesections += "\n<pre class='CodeRay'><code>:::#{codelang}"
	  			cleanCode = codesnip[0]["content"].gsub('<','&lt;')
	  			cleanCode = cleanCode.gsub('>','&gt;')
	  			examplesections += cleanCode
				examplesections += "<\n></code></pre>"


	  		}
	  	
			md += "<a name='e#{index.to_s}'></a><div class='accordion property' id='e"+ index.to_s + "'>"
		    md += '<div class="accordion-group">'
		    md += '<div class="accordion-heading">'
		    
		    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cExample' + index.to_s + '">'
		    md += '<strong>' + element["title"]  + '</strong>'
			md += '<i class="icon-chevron-down pull-left"></i></span>'
		    md += '</div>'
		    md += '<div id="cExample' + index.to_s + '" class="accordion-body collapse in">'
		    md +='  <div class="accordion-inner">'

		  	md += examplesections
		  	md += '  </div>'
		    md += '</div>'
		    md += '</div>'
			md += '</div>'
	  	}

	end
	return md
  end

  def self.getremarks(doc)
  	md = ""
  	if !doc["MODULE"][0]["REMARKS"].nil?
	  	s=doc["MODULE"][0]["REMARKS"][0]["REMARK"]
	  	s.each_with_index() { |element,index|
	  		md += "<a name='r#{index.to_s}'></a><div class='accordion property' id='r"+ index.to_s + "'>"
		    md += '<div class="accordion-group">'
		    md += '<div class="accordion-heading">'
		    
		    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cRemark' + index.to_s + '">'
		    md += '<strong>' + element["title"]  + '</strong>'
			md += '<i class="icon-chevron-down pull-left"></i></span>'
		    md += '</div>'
		    md += '<div id="cRemark' + index.to_s + '" class="accordion-body collapse in">'
		    md +='  <div class="accordion-inner">'
		    html = RDiscount.new(element["DESC"][0], :smart).to_html
		
		  	md += html
		  	md += '  </div>'
		    md += '</div>'
		    md += '</div>'
			md += '</div>'
	  	}

	end
	return md
  end


  #returns Markdown for the <Properties section
  def self.getproperties(doc)
  	md = ""
  	templatePropBag = true

  	if !doc["MODULE"][0]["TEMPLATES"].nil? && doc["MODULE"][0]["TEMPLATES"][0]["PROPERTY_BAG"].nil?
  		templatePropBag = false
  	end
  	if !doc["MODULE"][0]["PROPERTIES"].nil?
	  	s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}


	  	# a = doc.elements.each("//PROPERTIES/PROPERTY").to_a.sort {|x,y| x["name"].to_s y["name"].to_s}
	  	# puts a
		s.each() { |element| 
			propname = element["name"]
			propusage = ""
			propver = ""
			propnote = ""
			# type is optional default is STRING
			 #puts element
			if !element["VER_INTRODUCED"].nil?
				propver= "<span class='muted pull-right'>" + element["VER_INTRODUCED"][0] + "</span>"
				
			end
			if !element["APPLIES"].nil? 
				propnote= "\n<table class='note'>\n<td class='icon'></td><td class='content'>Applies to: " + element["APPLIES"][0] + "</td>\n</table>\n\n"
			end
			if element["type"].nil?
				proptype= " : <span class='text-info'>STRING</span>"
				propusage=getpropusagetext(getApiName(doc),element["name"],'STRING',element["readOnly"],templatePropBag)
			else
				proptype= " : <span class='text-info'>" + element["type"] + "</span>"
				propusage=getpropusagetext(getApiName(doc),element["name"],element["type"],element["readOnly"],templatePropBag)
			end
			# readOnly is optional default is false
			if element["readOnly"].nil?
				propreadOnly= ""
			else
				propreadOnly= element["readOnly"]
				if propreadOnly=="true"
					propreadOnly="<span class='label'>Read Only</span>"
				else
					propreadOnly=""
				end
			end
			
			if element["default"].nil?
				propdefault= ""
			else
				propdefault= "<p><strong>Default:</strong> " + element["default"] + "</p>"
				
			end
			
			@propdesc = element["DESC"][0]
			
			@propvalues = ""
			@propvaluetype = "STRING" #STRING IS DEFAULT IF NO TYPE SPECIFIED FOR propvalue
			@seperator = ""
			if !element["VALUES"].nil?
				@propvalues = ""
				element["VALUES"].each() { |velement|

					velement["VALUE"].each() { |vaelement|
						@propvaldesc = "<dl>"
						if !vaelement["DESC"].nil?
							if !vaelement["DESC"][0].empty?
								@propvaldesc = vaelement["DESC"][0].to_s
							else
								@propvaldesc = ""
							end 
						end	
						@seperator = ', '
						if !vaelement["type"].nil?
							@propvaluetype = !vaelement["type"]
						end
						@propvalues += "<dt>#{vaelement["value"]}</dt><dd>#{@propvaldesc}</dt>" 
						
					}
				@propvalues += "</dl>"

				}
			end
			if @propvalues != ""
				@propvalues = "<p><strong>Possible Values</strong> (<span class='text-info'>#{@propvaluetype}</span>):</p> " + @propvalues 
			end
		propreplaces = ""
		#puts doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0].empty?
		#puts "***" + doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"].to_s + "***"
		#Check to see if need to add to description about this method replacing a deprecated one
		if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"].nil?  && !doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0].empty?
	    	doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0]["ALIAS"].each() { |a|
				#puts a
				if a["existing"] == element["name"]
					propreplaces += a["new"]
				end
			}
		end
			# md += "\n" + '<h3 data-h2="properties">' + "#{propname}</h3>\n"
	  		# md += "<table width='100%'><tr>"
	  		# md += "<td width='75%'><b>" + getApiName(doc) + ".#{propname}</b><br/><i>#{@propdesc}</i>"
	  		# md += "<td><span class='pull-right'>#{proptype}<br/>#{propreadOnly}<br/>#{propdefault}</span></td>" 
	  		# md += "</tr><tr><td colspan='2'>#{@propvalues}</td></tr></table>\n\n" 
  	propdisplayname = propname
  	if propreplaces != ""
			#methname = methname + " <span class='pull-right label label-info'>Replaces:#{methreplaces}</span>"
			# @methdesc = " <span class='label label-info'>Replaces:#{methreplaces}</span>" + @methdesc
			propdisplayname = '<span class="text-info">' + propname + '</span>'
			@propdesc = "<span class='label label-info'>Replaces:#{propreplaces}</span> " + @propdesc

	end
  	md += "<a name='p#{propname}'></a><div class='accordion property' id='p"+ propname + "'>"
    md += '<div class="accordion-group">'
    md += '<div class="accordion-heading">'
    
    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cProperty' + propname + '">'
    md += '<strong>' + propdisplayname  + '</strong>' + "#{proptype} #{propreadOnly} #{propver}"
	md += '<i class="icon-chevron-down pull-left"></i></span>'
    md += '</div>'
    md += '<div id="cProperty' + propname + '" class="accordion-body collapse in">'
    md +='  <div class="accordion-inner">'

  	md += "#{@propdesc}#{propnote}#{propdefault}"
  	md += @propvalues
  	md += "<p>" + propusage + "</p>"
    md += '  </div>'
    md += '</div>'
    md += '</div>'
	md += '</div>'
	  	}
	end
  	return md
  end

#returns Markdown for the <Properties section
  def self.getmethods(doc)
  	#puts "********************* METHODS *************"
	#puts doc["MODULE"][0]["METHODS"][0]
  	md = ""

  	
  	@methsectionparams= ""
  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]}
    
    #puts methodaliases
		
	s.each() { |element| 
		#puts element
		#puts "\n\n"
		methname = element["name"]
		methdeprecated = ""
		if !element["deprecated"].nil?
			methdeprecated = element["deprecated"]
		end
		@methhascallback = ""
		if !element["hasCallback"].nil?
		
			@methhascallback = element["hasCallback"]
		end 
		
		@methdesc = element["DESC"][0]
		methreplaces = ""
		#Check to see if need to add to description about this method replacing a deprecated one
		if !doc["MODULE"][0]["METHODS"].nil? && !doc["MODULE"][0]["METHODS"][0]["ALIASES"].nil?  && !doc["MODULE"][0]["METHODS"][0]["ALIASES"][0].empty?
	    	doc["MODULE"][0]["METHODS"][0]["ALIASES"][0]["ALIAS"].each() { |a|
				#puts a
				if a["existing"] == element["name"]
					methreplaces += a["new"]
				end
			}
		end
		
		@methreturn = "Void"
		@methreturndesc=""
		if !element["RETURN"].nil?
			element["RETURN"].each() { |relement|
				if relement["type"].nil? || relement["type"]==''
					@methreturn="Void"
				else
					@methreturn = relement["type"]
				end	
				
				# puts relement
		
				if !relement["DESC"].nil?
					@methreturndesc=" : " + relement["DESC"][0]
				end
			}
		end
		@methsectionreturns = "<div>"
		@methsectionreturns += "<p><strong>Return:</strong></p><ul>"
		@methsectionreturns += "<li>#{@methreturn}#{@methreturndesc}</li></ul></div>"
			
		@methparams = ""
		@methparamsdetails = ""
		@methsectionparams = ""
			
		@seperator = ""
		if !element["PARAMS"].nil?
			@methsectionparams = "<div>"
			@methsectionparams += "<p><strong>Parameters</strong></p><ul>"
			element["PARAMS"].each { |params|
				params["PARAM"].each { |param|
					@methparamsdetailsdesc = ''
			
					# puts param
					if !param["DESC"].nil?
						@methparamsdetailsdesc=param["DESC"][0]
						if @methparamsdetailsdesc.to_s == '{}'
							@methparamsdetailsdesc= ''
						end
					end

					@methparamsnil=""
					@methparamsnildesc=""
					if !param["CAN_BE_NIL"].nil?
						param["CAN_BE_NIL"].each { |paramsnil|
							@methparamsnil=" <span class='label label-info'>Optional</span>"
							if !paramsnil["DESC"].nil?
								@methparamsnildesc =  paramsnil["DESC"][0]
							end
							
						}
					end
					
					if param["type"].nil?
						param["type"] = "STRING"
					end
					@methparams += @seperator + '<span class="text-info">' + param["type"] + "</span> " + param["name"]
					@seperator =  ', '
					
					@methparamsdetails += "<tr><td>" + param["name"] + "</td><td>" + param["type"] + "</td><td>" + @methparamsdetailsdesc + "</td><td>" + @methparamsnil + "</td></tr>"

					@methsectionparams += "<li>" + param["name"] + " : <span class='text-info'>" + param["type"] + "</span>#{@methparamsnil}<p>" + @methparamsdetailsdesc + " " + @methparamsnildesc + "</p></li>"

				}

			}
			#add generic syntax for callback param
			if @methhascallback !="" && @methhascallback != "none"
				@methcallbackoptional= ""
				if @methhascallback == "optional"
					@methcallbackoptional = " <span class='label label-info'>Optional</span> "
				end
				@methcallbackparamdesc = "<p>The callback parameter can take on one of three forms</p><ol>"
				@methcallbackparamdesc += "<li>Controller action URL"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc) + ".#{methname}(....," + " url_for :action => :mycallback)</code></pre>"
				@methcallbackparamdesc += "<p>Javascript</p>\n<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc) + ".#{methname}(....," + "'/app/model/mycallback');</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Anonymous function:"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc) + ".#{methname}(....," + "lambda{ \n|params| }\nProc.new{\n |params| })</code></pre>"
				@methcallbackparamdesc += "<p>Javascript</p>\n<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc) + ".#{methname}(....," + "function(params){\n//Your code here\n};);</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Function"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc) + ".#{methname}(....," + " mycallback() )</code></pre>"
				@methcallbackparamdesc += "<p>Javascript</p>\nok	<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc) + ".#{methname}(....," + " mycallback());</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "</ol>"
				
				@methsectionparams += "<li>callback : <span class='text-info'>Callback &lt;Object&gt;</span>#{@methcallbackoptional}<p>#{@methcallbackparamdesc}" +  "</p></li>"

  			end
			@methsectionparams += "</ul></div>"
			
		end
		@methsample = "<b>" + getApiName(doc) + ".#{methname}(#{@methparams})</b><br/>"
		if @methparams != ""
			# @methvalues = "<br/><b>Possible Values:</b> " + @methvalues
		end
		if @methhascallback !="" && @methhascallback != "none"
			@callbackrubysample = "url_for :action => :take_callback"
			@callbackjssample = "callback_function"
			if @methparams != ""
				@methparams = @methparams + ", <span class='text-info'>Callback &lt;Object&gt;</span> callback"
			end
			@methsample = "Ruby Syntax:<br/><b>" + getApiName(doc) + ".#{methname}(#{@methparams}#{@callbackrubysample})</b><br/>"
			@methsample += "<br/>Javascript Syntax:<br/><b>" + getApiName(doc) + ".#{methname}(#{@methparams}#{@callbackjssample})</b><br/><br/>"
			if @methhascallback == "optional"
				@methsample += "Callback function is optional.<br/><br/>"
			end
			
  		end
  		if methdeprecated == "true"
			#methname = methname + ' <span class="pull-right label label-important">deprecated</span>'
			methname = '<span class="text-error">' + methname + '</span>'
			@methdesc = "<span class='label label-important'>deprecated</span> " + @methdesc
		end
		if methreplaces != ""
			#methname = methname + " <span class='pull-right label label-info'>Replaces:#{methreplaces}</span>"
			# @methdesc = " <span class='label label-info'>Replaces:#{methreplaces}</span>" + @methdesc
			methname = '<span class="text-info">' + methname + '</span>'
			@methdesc = "<span class='label label-info'>Replaces:#{methreplaces}</span> " + @methdesc

		end
		# md += "\n" + '<h3 data-h2="methods">' + "#{methname}</h3>\n"

  		# md += "<table class='table  table-condensed'><tr>"
  		# md += "<td>#{@methsample}#{@methdesc}"
  		# md += "</td><td><span class='pull-right'>#{@methreturn}<br/>#{@methreturndesc}</span></td>" 
  		if @methparamsdetails != ""
  			# md += "<tr><td colspan='2'><b>Parameters</b><br/><table class='table table-bordered'>"
  			# md += "<thead><tr><td>Name</td><td>Type</td><td>Description</td><td>Can Be Nil</td></tr></thead>"
  			# md += @methparamsdetails
  			# md += "</table></td></tr>"
  		end
  		@methsectioncallbackparams = ""
		
  		if @methhascallback !="" && @methhascallback != "none"
  			# md += "<tr><td colspan='2'><b>Callback Return Values</b><br/><table class='table table-bordered'>"
  			# md += "<thead><tr><td>Name</td><td>Type</td><td>Description</td></tr></thead>"
			@methcallbackdetails = ""
			
			if !element["CALLBACK"].nil? && !element["CALLBACK"][0]["PARAMS"].nil?
				@methsectioncallbackparams = "<div>"
				@methsectioncallbackparams += "<p><strong>Callback Returning Parameters</strong></p><ul>"
			
				element["CALLBACK"][0]["PARAMS"].each { |params|
					params["PARAM"].each { |param|

						if !param["DESC"].nil?
							@methcallbackdetailsdesc=param["DESC"][0]
						end

						
						
						if param["type"].nil?
							param["type"] = "STRING"
						end
						if !param["deprecated"].nil?  && param["deprecated"]== "true"
							param["name"] = '<span class="text-error">' + param["name"] + '</span>'
			
							param["type"] += " <span class='label label-important'>deprecated</span> "
						end
						@methcallbackdetails += "<tr><td>" + param["name"] + "</td><td>" + param["type"] + "</td><td>" + @methcallbackdetailsdesc + "</td></tr>"
						@methsectioncallbackparams += "<li>" + param["name"] + " : <span class='text-info'>" + param["type"] + "</span><p>" + @methcallbackdetailsdesc + "</p></li>"

					}

				}
				@methsectioncallbackparams += "</ul></div>"
			end  			
  			# md += @methcallbackdetails
  			# md += "</table></td></tr>"

  		end
  		# md += "</tr></table>\n\n" 

  	md += "<div class='accordion method' id='m"+ element["name"] + "'>"
    md += '<div class="accordion-group">'
    md += '<div class="accordion-heading">'
    
    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cMethod' + element["name"] + '">'
    md += '<strong data-toggle="tooltip" title data-original-title="' + @methdesc + '">' + methname + '</strong>' + "(#{@methparams})"
	md += '<i class="icon-chevron-down pull-right"></i></span>'
    md += '</div>'
    md += '<div id="cMethod' + element["name"] + '" class="accordion-body collapse in">'
    md +='  <div class="accordion-inner">'

  	md += "" + @methdesc + ""
  	md += "" + @methsectionparams + ""
  	md += @methsectionreturns
  	md += @methsectioncallbackparams
    md += '  </div>'
    md += '</div>'
    md += '</div>'
	md += '</div>'

  	}

  	return md
  end


  def self.markdown(topic)
    md = ''

  	# xml = File.read(topic)
  	# doc = REXML::Document.new xml
  	
  	#puts topic
  	doc = XmlSimple.xml_in(topic)
  	templatePropBag = true
  	if !doc["MODULE"][0]["TEMPLATES"][0].nil? && doc["MODULE"][0]["TEMPLATES"][0]["PROPERTY_BAG"].nil?
  		templatePropBag = false
  	end
  	templateDefault = true
  	if !doc["MODULE"][0]["TEMPLATES"][0].nil? && doc["MODULE"][0]["TEMPLATES"][0]["DEFAULT_INSTANCE"].nil?
  		templateDefault = false
  	end
  	templateSingleton = true
  	if !doc["MODULE"][0]["TEMPLATES"][0].nil? && doc["MODULE"][0]["TEMPLATES"][0]["SINGLETON_INSTANCES"].nil?
  		templateSingleton = false
  	end
  	if templateDefault
  		#get xml from file and put it in main array so it is handled like other methods
  		defaultdoc = XmlSimple.xml_in('docs/api/default_instance.xml')
		defaultdoc["METHODS"][0]["METHOD"].each { |m|
			doc["MODULE"][0]["METHODS"][0]["METHOD"].push(m)
		}
  	end
  	if templateSingleton
  		#get xml from file and put it in main array so it is handled like other methods
  		singletondoc = XmlSimple.xml_in('docs/api/singleton_instances.xml')
		singletondoc["METHODS"][0]["METHOD"].each { |m|
			doc["MODULE"][0]["METHODS"][0]["METHOD"].push(m)
		}
  	end
  	if templatePropBag
  		#get xml from file and put it in main array so it is handled like other methods
  		propbagdoc = XmlSimple.xml_in('docs/api/property_bag.xml')
		propbagdoc["METHODS"][0]["METHOD"].each { |m|
			doc["MODULE"][0]["METHODS"][0]["METHOD"].push(m)
		}
  	end
  	#get api name from <MODULE name="" ...
  	# need to figure out what to do if multiple <MODULE tags in one physical file
  	#puts doc

  	docproperties = getproperties(doc)
  	docexamples = getexamples(doc)
  	docremarks = getremarks(doc)
  	examplelinks = getexamplelinks(doc)
  	remarklinks = getremarklinks(doc)
  	proplinks = getpropertieslinks(doc)
  	methlinks = getmethodslinks(doc)
  	md += "#" + getApiName(doc) + "\n" 
  	if !examplelinks.empty?
	  	md += '<div class="btn-group">'
	  	md += ''
	  	md += '<a href="#Examples" class="btn"><i class="icon-edit"></i> Examples</a>'
	    md += '<button href="#" class="btn dropdown-toggle" data-toggle="dropdown">'
	    md += '  <span class="caret"></span>&nbsp;'
	    md += '</button>'
	    md += '<ul class="dropdown-menu">'
	    md += examplelinks
	    md += '</ul>'
	  	md += '</div>'
  	end 
  	if !proplinks.empty?
	  	md += '<div class="btn-group">'
	  	md += ''
	  	md += '<a href="#Properties" class="btn"><i class="icon-list"></i> Properties</a>'
	    md += '<button href="#" class="btn dropdown-toggle" data-toggle="dropdown">'
	    md += '  <span class="caret"></span>&nbsp;'
	    md += '</button>'
	    md += '<ul class="dropdown-menu">'
	    # md += '<li class="dropdown-submenu">
     #              <a href="#">More options</a>
     #              <ul class="dropdown-menu">
     #                <li class="dropdown-submenu">
     #              <a href="#">More options</a>
     #              <ul class="dropdown-menu">
     #                <li><a href="#">Second level link</a></li>
     #                <li><a href="#">Second level link</a></li>
     #                <li><a href="#">Second level link</a></li>
     #                <li><a href="#">Second level link</a></li>
     #                <li><a href="#">Second level link</a></li>
     #              </ul>
     #            </li>
     #            <li><a href="#">Second level link</a></li>
     #                <li><a href="#">Second level link</a></li>
     #                <li><a href="#">Second level link</a></li>
     #                <li><a href="#">Second level link</a></li>
     #              </ul>
     #            </li>'
	    md += proplinks
	    md += '</ul>'
	  	md += '</div>'
  	end 
  	if !methlinks.empty?
	  	md += '<div class="btn-group">'
	    md += '<a href="#Methods" class="btn"><i class="icon-cog"></i> Methods</a>'
	    md += '<a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >'
	    md += '  <span class="caret"></span>&nbsp;'
	    md += '</a>'
	    md += '<ul class="dropdown-menu">'
	    md += methlinks
	    md += '</ul>'
	  	md += '</div>'
		md += '<div class="btn-group pull-right">'
	    md += '<button class="btn" id="expandAll" tooltip="Expand all"><i class="icon-th-list "></i>&nbsp;</button>'
	  	md += '</div>'
  	end
  	if !remarklinks.empty?
	  	md += '<div class="btn-group">'
	  	md += ''
	  	md += '<a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks</a>'
	    md += '<button href="#" class="btn dropdown-toggle" data-toggle="dropdown">'
	    md += '  <span class="caret"></span>&nbsp;'
	    md += '</button>'
	    md += '<ul class="dropdown-menu">'
	    md += remarklinks
	    md += '</ul>'
	  	md += '</div>'
  	end 
	md += '<div data-spy="scroll"  >'

  	md += "\n" + getApiDesc(doc) + "\n" 
  	if docexamples !=""
	  	 md += "\n<a name='Examples'></a>\n<h2><i class='icon-edit'></i>Examples</h2>" + "\n\n" 
	  	 md += "" + docexamples + ""
  	end 
  	if docproperties !=""
	  	 md += "\n<a name='Properties'></a>\n<h2><i class='icon-list'></i>Properties</h2>" + "\n\n" 
	  	 md += "" + docproperties + ""
  	end 
  	md += "\n<a name='Methods'></a>\n" + "<h2><i class='icon-cog'></i>Methods</h2>" + "\n\n" 
	
  	md += '<div class="accordion" id="accordion">'
    
  	md += "" + getmethods(doc) + ""
    md += "</div>"
    if docremarks !=""
	  	 md += "\n<a name='Remarks'></a>\n<h2><i class='icon-warning-sign'></i>Remarks</h2>" + "\n\n" 
	  	 md += "" + docremarks + ""
  	end 
  	
    md += "</div>"
  	# puts md
  	File.open("#{topic.gsub!('.xml','.txt')}", 'w') {|f| f.write(md) }
  return md
  end
	

	
end
