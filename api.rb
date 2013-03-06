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
 

  #returns Markdown for the <Properties section
  def self.getproperties(doc)
  	md = ""
  	if !doc["MODULE"][0]["PROPERTIES"].nil?
	  	s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}


	  	# a = doc.elements.each("//PROPERTIES/PROPERTY").to_a.sort {|x,y| x["name"].to_s y["name"].to_s}
	  	# puts a
		s.each() { |element| 
			propname = element["name"]
			# type is optional default is STRING
			if element["name"].nil?
				proptype= "STRING"
			else
				proptype= element["type"]
			end

			# readOnly is optional default is false
			if element["readOnly"].nil?
				propreadOnly= ""
			else
				propreadOnly= element["readOnly"]
				if propreadOnly=="true"
					propreadOnly="Read Only"
				else
					propreadOnly=""
				end
			end
			
			if element["default"].nil?
				propdefault= ""
			else
				propdefault= "Default: " + element["default"]
				
			end
			
			@propdesc = element["DESC"][0]
			
			@propvalues = ""
			@propvaluetype = "STRING" #STRING IS DEFAULT IF NO TYPE SPECIFIED FOR propvalue
			@seperator = ""
			if !element["VALUES"].nil?
				@propvalues = "<table class='table-condensed'>"
				element["VALUES"].each() { |velement|

					velement["VALUE"].each() { |vaelement|
						@propvaldesc = ""
						if !vaelement["DESC"].nil?
							if vaelement["DESC"][0].to_s.length > 0
								@propvaldesc = vaelement["DESC"][0].to_s
							end 
						end	
						@seperator = ', '
						if !vaelement["type"].nil?
							@propvaluetype = !vaelement["type"]
						end
						@propvalues += "<tr><td><b>#{vaelement["value"]}</b></td><td>#{@propvaldesc}</td></tr>" 
						
					}
				@propvalues += "</table>"

				}
			end
			if @propvalues != ""
				@propvalues = "<br/><br/><b>Possible Values (#{@propvaluetype}):<br/></b> " + @propvalues
			end

			md += "\n" + '<h3 data-h2="properties">' + "#{propname}</h3>\n"
	  		md += "<table width='100%'><tr>"
	  		md += "<td width='75%'><b>" + getApiName(doc) + ".#{propname}</b><br/><i>#{@propdesc}</i>"
	  		md += "<td><span class='pull-right'>#{proptype}<br/>#{propreadOnly}<br/>#{propdefault}</span></td>" 
	  		md += "</tr><tr><td colspan='2'>#{@propvalues}</td></tr></table>\n\n" 

	  	}
	end
  	return md
  end

#returns Markdown for the <Properties section
  def self.getmethods(doc)
  	md = ""
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
				@methreturn = relement["type"]
				# puts relement
		
				if !relement["DESC"].nil?
					@methreturndesc=relement["DESC"][0]
				end
			}
		end
		@methparams = ""
		@methparamsdetails = ""
		@seperator = ""
		if !element["PARAMS"].nil?
			element["PARAMS"].each { |params|
				params["PARAM"].each { |param|

					if !param["DESC"].nil?
						@methparamsdetailsdesc=param["DESC"][0]
					end

					@methparamsnil="No"
					if !param["CAN_BE_NIL"].nil?
						param["CAN_BE_NIL"].each { |paramsnil|
							@methparamsnil="Yes"
							if !paramsnil["DESC"].nil?
								@methparamsnil += "<BR/>" + paramsnil["DESC"][0]
							end
							
						}
					end
					
					@methparams += @seperator + param["name"]
					@seperator =  ', '
					if param["type"].nil?
						param["type"] = "STRING"
					end
					@methparamsdetails += "<tr><td>" + param["name"] + "</td><td>" + param["type"] + "</td><td>" + @methparamsdetailsdesc + "</td><td>" + @methparamsnil + "</td></tr>"
				}

			}
		end
		@methsample = "<b>" + getApiName(doc) + ".#{methname}(#{@methparams})</b><br/>"
		if @methparams != ""
			# @methvalues = "<br/><b>Possible Values:</b> " + @methvalues
		end
		if @methhascallback !="" && @methhascallback != "none"
			@callbackrubysample = "url_for :action => :take_callback"
			@callbackjssample = "callback_function"
			if @methparams != ""
				@methparams = ", " + @methparams
			end
			@methsample = "Ruby Syntax:<br/><b>" + getApiName(doc) + ".#{methname}(#{@callbackrubysample}#{@methparams})</b><br/>"
			@methsample += "<br/>Javascript Syntax:<br/><b>" + getApiName(doc) + ".#{methname}(#{@callbackjssample}#{@methparams})</b><br/><br/>"
			if @methhascallback == "optional"
				@methsample += "Callback function is optional.<br/><br/>"
			end
			
  		end
  		if methdeprecated == "true"
			methname = methname + ' <span class="pull-right label label-important">deprecated</span>'
		end
		if methreplaces != ""
			methname = methname + " <span class='pull-right label label-info'>Replaces:#{methreplaces}</span>"
		end
		md += "\n" + '<h3 data-h2="methods">' + "#{methname}</h3>\n"

  		md += "<table class='table  table-condensed'><tr>"
  		md += "<td>#{@methsample}#{@methdesc}"
  		md += "</td><td><span class='pull-right'>#{@methreturn}<br/>#{@methreturndesc}</span></td>" 
  		if @methparamsdetails != ""
  			md += "<tr><td colspan='2'><b>Parameters</b><br/><table class='table table-bordered'>"
  			md += "<thead><tr><td>Name</td><td>Type</td><td>Description</td><td>Can Be Nil</td></tr></thead>"
  			md += @methparamsdetails
  			md += "</table></td></tr>"
  		end
  		if @methhascallback !="" && @methhascallback != "none"
  			md += "<tr><td colspan='2'><b>Callback Return Values</b><br/><table class='table table-bordered'>"
  			md += "<thead><tr><td>Name</td><td>Type</td><td>Description</td></tr></thead>"
			@methcallbackdetails = ""
			
			if !element["CALLBACK"].nil? && !element["CALLBACK"][0]["PARAMS"].nil?
				element["CALLBACK"][0]["PARAMS"].each { |params|
					params["PARAM"].each { |param|

						if !param["DESC"].nil?
							@methcallbackdetailsdesc=param["DESC"][0]
						end

						
						
						if param["type"].nil?
							param["type"] = "STRING"
						end
						@methcallbackdetails += "<tr><td>" + param["name"] + "</td><td>" + param["type"] + "</td><td>" + @methcallbackdetailsdesc + "</td></tr>"
					}

				}
			end  			
  			md += @methcallbackdetails
  			md += "</table></td></tr>"

  		end
  		md += "</tr></table>\n\n" 

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
  	md += "\n" + getApiDesc(doc) + "\n" 
  	if docproperties !=""
	  	 md += "##Properties" + "\n\n" 
	  	 md += "" + getproperties(doc) + ""
  	end 
	 md += "##Methods" + "\n\n" 
  	 md += "" + getmethods(doc) + ""

  	# puts md

  return md
  end
	

	
end
