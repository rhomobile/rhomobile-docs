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
				propdefault= element["default"]
				
			end
			
			@propdesc = element["DESC"][0]
			
			@propvalues = ""
			@propvaluetype = "STRING" #STRING IS DEFAULT IF NO TYPE SPECIFIED FOR propvalue
			@seperator = ""
			if !element["VALUES"].nil?
				element["VALUES"].each() { |velement|

					velement["VALUE"].each() { |vaelement|
						@propvalues += @seperator + vaelement["value"]
						@seperator = ', '
						if !vaelement["type"].nil?
							@propvaluetype = !vaelement["type"]
						end
					}

				}
			end
			if @propvalues != ""
				@propvalues = "<br/><br/><b>Possible Values (#{@propvaluetype}):<br/></b> " + @propvalues
			end

			md += "\n" + '<h3 data-h2="properties">' + "#{propname}</h3>\n"
	  		md += "<table width='100%'><tr>"
	  		md += "<td width='75%'><b>" + getApiName(doc) + ".#{propname}</b><br/><i>#{@propdesc}</i>#{@propvalues}"
	  		md += "<td>#{proptype}<br/>#{propreadOnly}<br/>#{propdefault}</td>" 
	  		md += "</tr></table>\n\n" 

	  	}
	end
  	return md
  end

#returns Markdown for the <Properties section
  def self.getmethods(doc)
  	md = ""
  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]}

	s.each() { |element| 
		methname = element["name"]
		
		
		@methdesc = element["DESC"][0]
		
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
		if @methparams != ""
			# @methvalues = "<br/><b>Possible Values:</b> " + @methvalues
		end

		md += "\n" + '<h3 data-h2="methods">' + "#{methname}</h3>\n"
  		md += "<table class='table  table-condensed'><tr>"
  		md += "<td><b>" + getApiName(doc) + ".#{methname}(#{@methparams})</b><br/>#{@methdesc}"
  		md += "</td><td>#{@methreturn}<br/>#{@methreturndesc}</td>" 
  		if @methparamsdetails != ""
  			md += "<tr><td colspan='2'><table class='table table-bordered'>"
  			md += "<thead><tr><td>Name</td><td>Type</td><td>Description</td><td>Can Be Nil</td></tr></thead>"
  			md += @methparamsdetails
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

  	docproperties = getproperties(doc)
  	md += "#" + getApiName(doc) + "\n" 
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
