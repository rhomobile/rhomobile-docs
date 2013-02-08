require 'rexml/document'

class Api


#returns markdown for the name of the API 
  def self.getApiName(doc)
  	md=""
  	doc.elements.each("//MODULE") { |element| 
  		md = element.attributes["name"] 
  	}
  	return md
  end
  
  #returns Markdown for the <Properties section
  def self.getproperties(doc)
  	md = ""
	doc.elements.each("//PROPERTIES/PROPERTY") { |element| 
		propname = element.attributes["name"]
		# type is optional default is STRING
		if element.attributes["name"].nil?
			proptype= "STRING"
		else
			proptype= element.attributes["type"]
		end

		# readOnly is optional default is false
		if element.attributes["readOnly"].nil?
			propreadOnly= ""
		else
			propreadOnly= element.attributes["readOnly"]
			if propreadOnly=="true"
				propreadOnly="Read Only"
			else
				propreadOnly=""
			end
		end
		
		if element.attributes["default"].nil?
			propdefault= ""
		else
			propdefault= element.attributes["default"]
			
		end
		
		@propdesc = ""
		element.elements.each("DESC") { |delement|
			@propdesc = delement.text
		}
		
		@propvalues = ""
		@propvaluetype = "STRING" #STRING IS DEFAULT IF NO TYPE SPECIFIED FOR propvalue
		@seperator = ""
		element.elements.each("VALUES") { |velement|
			velement.elements.each("VALUE") { |vaelement|
				@propvalues += @seperator + vaelement.attributes["value"]
				@seperator = ', '
				if !vaelement.attributes["type"].nil?
					@propvaluetype = !vaelement.attributes["type"]
				end
			}

		}
		if @propvalues != ""
			@propvalues = "<br/><br/><b>Possible Values (#{@propvaluetype}):<br/></b> " + @propvalues
		end

		md += "\n" + '###' + "#{propname}\n"
  		md += "<table width='100%'><tr>"
  		md += "<td width='75%'><b>" + getApiName(doc) + ".#{propname}</b><br/><i>#{@propdesc}</i>#{@propvalues}"
  		md += "<td>#{proptype}<br/>#{propreadOnly}<br/>#{propdefault}</td>" 
  		md += "</tr></table>\n\n" 

  	}
  	return md
  end

#returns Markdown for the <Properties section
  def self.getmethods(doc)
  	md = ""
	doc.elements.each("//METHODS/METHOD") { |element| 
		methname = element.attributes["name"]
		
		
		@methdesc = ""
		element.elements.each("DESC") { |delement|
			@methdesc = delement.text
		}
		
		@methreturn = "Void"
		@methreturndesc=""
		element.elements.each("RETURN") { |relement|
			@methreturn = relement.attributes["type"]
			@methreturndesc=""
				relement.elements.each("DESC") { |paramsreturndesc|
					@methreturndesc=paramsreturndesc.text
				}
		}

		@methparams = ""
		@methparamsdetails = ""
		@seperator = ""
		element.elements.each("PARAMS") { |params|
			params.elements.each("PARAM") { |param|
				@methparamsdetailsdesc=""
				param.elements.each("DESC") { |paramsdesc|
					@methparamsdetailsdesc=paramsdesc.text
				}

				@methparamsnil="No"
				param.elements.each("CAN_BE_NIL") { |paramsnil|
					@methparamsnil="Yes"
					@methparamsnildesc=""
					paramsnil.elements.each("DESC") { |paramsnildesc|
						@methparamsnildesc="<BR/>" + paramsnildesc.text
					}
					@methparamsnil += @methparamsnildesc
				}
				


				@methparams += @seperator + param.attributes["name"]
				@seperator =  ', '
				if param.attributes["type"].nil?
					param.attributes["type"] = "STRING"
				end
				@methparamsdetails += "<tr><td>" + param.attributes["name"] + "</td><td>" + param.attributes["type"] + "</td><td>" + @methparamsdetailsdesc + "</td><td>" + @methparamsnil + "</td></tr>"
			}

		}
		if @methparams != ""
			# @methvalues = "<br/><b>Possible Values:</b> " + @methvalues
		end

		md += "\n" + '###' + "#{methname}\n"
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

  	xml = File.read(topic)
  	doc = REXML::Document.new xml
  	
  	#get api name from <MODULE name="" ...
  	# need to figure out what to do if multiple <MODULE tags in one physical file

  	md += "#" + getApiName(doc) + "\n" 
  	 md += "##Properties" + "\n\n" 
  	 md += "" + getproperties(doc) + ""
	 md += "##Methods" + "\n\n" 
  	 md += "" + getmethods(doc) + ""

  	puts md

  return md
  end
	

	
end
