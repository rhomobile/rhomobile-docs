require 'xmlsimple'

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
 
  def self.getpropusagetext(model,property,type)
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
  	md = "\n\n<strong>Ruby Usage</strong>"
  	md += "\n\n<pre>"
  	md += "\n# Setting directly"
  	md += "\n"
  	md += "#{model}.#{property}=#{defval}"
  	md += "\n# Setting one property"
  	md += "\n"
  	md += "#{model}.setProperty " + ":#{property}, #{defval} "
  	md += "\n# Setting multiple properties using HASH"
  	md += "\n"
  	md += "#{model}.setProperties { " + ":#{property} => #{defval} , :another_property => #{defval}}"
  	md += "\n\n# Getting one property"
  	md += "\n"
  	md += "myvar = #{model}.getProperty(" + "'#{property}')"
  	md += "\n# Getting multiple properties"
  	md += "\n"
  	md += "myvar = #{model}.getProperties([" + "'#{property}' , 'another_property'])"
  	md += "</pre>" 

  	md += "\n\n<strong>Javascript Usage</strong>"
  	md += "\n\n<pre>"
  	md += "\n# Setting directly"
  	md += "\n"
  	md += "#{model}.#{property}=#{defval};"
  	md += "\n# Setting one property"
  	md += "\n"
  	md += "#{model}.setProperty(" + "'#{property}',#{defval});"
  	md += "\n# Setting multiple properties using JSON object"
  	md += "\n"
  	md += "#{model}.setProperties({ " + ":#{property}:#{defval} , :another_property:#{defval}});"
  	md += "\n\n# Getting one property"
  	md += "\n"
  	md += "myvar = #{model}.getProperty(" + "'#{property}');"
  	md += "\n# Getting multiple properties"
  	md += "\n"
  	md += "myvar = #{model}.getProperties([" + "'#{property}' , 'another_property']);"
  	md += "</pre>" 

  end
  def self.getpropertieslinks(doc)
  	md = ""
  	if !doc["MODULE"][0]["PROPERTIES"].nil?
	  	s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}
	  	s.each() { |element|
	  		md += '<li><a href="#p' + element["name"] + '">' + element["name"] + "</a></li>" 
		}
  	end
  	return md
  end

  def self.getmethodslinks(doc)
  	md = ""
  	if !doc["MODULE"][0]["PROPERTIES"].nil?
	  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]}
	  	s.each() { |element|
	  		md += '<li><a href="#m' + element["name"] + '">' + element["name"] + "</a></li>" 
		}
  	end
  	return md
  end

  #returns Markdown for the <Properties section
  def self.getproperties(doc)
  	md = ""
  	if !doc["MODULE"][0]["PROPERTIES"].nil?
	  	s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}


	  	# a = doc.elements.each("//PROPERTIES/PROPERTY").to_a.sort {|x,y| x["name"].to_s y["name"].to_s}
	  	# puts a
		s.each() { |element| 
			propname = element["name"]
			propusage = ""
			# type is optional default is STRING
			if element["type"].nil?
				proptype= " : <span class='text-info'>STRING</span>"
				propusage=getpropusagetext(getApiName(doc),element["name"],'STRING')
			else
				proptype= " : <span class='text-info'>" + element["type"] + "</span>"
				propusage=getpropusagetext(getApiName(doc),element["name"],element["type"])
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
							if vaelement["DESC"][0].to_s.length > 0
								@propvaldesc = vaelement["DESC"][0].to_s
							end 
						end	
						@seperator = ', '
						if !vaelement["type"].nil?
							@propvaluetype = !vaelement["type"]
						end
						@propvalues += "<dt>#{vaelement["constName"]}</dt><dd>#{@propvaldesc}<dt>" 
						
					}
				@propvalues += "</dl>"

				}
			end
			if @propvalues != ""
				@propvalues = "<p><strong>Possible Values</strong> (<span class='text-info'>#{@propvaluetype}</span>):</p> " + @propvalues 
			end

			# md += "\n" + '<h3 data-h2="properties">' + "#{propname}</h3>\n"
	  		# md += "<table width='100%'><tr>"
	  		# md += "<td width='75%'><b>" + getApiName(doc) + ".#{propname}</b><br/><i>#{@propdesc}</i>"
	  		# md += "<td><span class='pull-right'>#{proptype}<br/>#{propreadOnly}<br/>#{propdefault}</span></td>" 
	  		# md += "</tr><tr><td colspan='2'>#{@propvalues}</td></tr></table>\n\n" 
  	
  	md += "<a name='p#{propname}'></a><div class='accordion property' id='p"+ propname + "'>"
    md += '<div class="accordion-group">'
    md += '<div class="accordion-heading">'
    
    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cProperty' + propname + '">'
    md += '<strong>' + propname  + '</strong>' + "#{proptype} #{propreadOnly}"
	md += '<i class="icon-chevron-down pull-left"></i></span>'
    md += '</div>'
    md += '<div id="cProperty' + propname + '" class="accordion-body collapse">'
    md +='  <div class="accordion-inner">'

  	md += "#{@propdesc}#{propdefault}"
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
		if !doc["MODULE"][0]["METHODS"][0]["ALIASES"].nil?
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
				if element["type"].nil? || element["type"]==''
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

					if !param["DESC"].nil?
						@methparamsdetailsdesc=param["DESC"][0]
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
				@methcallbackparamdesc += "<p>Ruby</p><pre>" + "" + getApiName(doc) + ".#{methname}(....," + " url_for :action => :mycallback)</pre>"
				@methcallbackparamdesc += "<p>Javascript</p><pre>" + "" + getApiName(doc) + ".#{methname}(....," + "'/app/model/mycallback');</pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Anonymous function:"
				@methcallbackparamdesc += "<p>Ruby</p><pre>" + "" + getApiName(doc) + ".#{methname}(....," + "lambda{ \n|params| }\nProc.new{\n |params| })</pre>"
				@methcallbackparamdesc += "<p>Javascript</p><pre>" + "" + getApiName(doc) + ".#{methname}(....," + "function(params){\n//Your code here\n};);</pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Function"
				@methcallbackparamdesc += "<p>Ruby</p><pre>" + "" + getApiName(doc) + ".#{methname}(....," + " mycallback() )</pre>"
				@methcallbackparamdesc += "<p>Javascript</p><pre>" + "" + getApiName(doc) + ".#{methname}(....," + " mycallback());</pre>"
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
    md += '<div id="cMethod' + element["name"] + '" class="accordion-body collapse">'
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
  	
  	doc = XmlSimple.xml_in(topic)
  	#get api name from <MODULE name="" ...
  	# need to figure out what to do if multiple <MODULE tags in one physical file
  	#puts doc

  	docproperties = getproperties(doc)
  	md += "#" + getApiName(doc) + "\n" 
  	md += '<div class="navbar"><div class="navbar-inner"><ul class="nav">'
  	md += '<li class="dropdown">'
    md += '<a href="#" class="dropdown-toggle" data-toggle="dropdown">'
    md += '  <i class="icon-list"></i>Properties'
    md += '  <b class="caret"></b>'
    md += '</a>'
    md += '<ul class="dropdown-menu">'
    md += getpropertieslinks(doc)
    md += '</ul>'
  	md += '</li>'
  	md += '<li class="dropdown">'
    md += '<a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >'
    md += '  <i class="icon-cog"></i>Methods'
    md += '  <b class="caret"></b>'
    md += '</a>'
    md += '<ul class="dropdown-menu">'
    md += getmethodslinks(doc)
    md += '</ul>'
  	md += '</li>'
	md += '</ul></div></div><div data-spy="scroll"  >'

  	md += "\n" + getApiDesc(doc) + "\n" 
  	if docproperties !=""
	  	 md += "<h2><i class='icon-list'></i>Properties</h2>" + "\n\n" 
	  	 md += "" + getproperties(doc) + ""
  	end 
  	md += "\n<a name='Methods'></a>\n" + "<h2><i class='icon-cog'></i>Methods</h2>" + "\n\n" 
	
  	md += '<div class="accordion" id="accordion">'
    
  	md += "" + getmethods(doc) + ""
    md += "</div></div>"
  	# puts md

  return md
  end
	

	
end
