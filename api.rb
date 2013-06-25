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
	  	if !doc["MODULE"][0]["MORE_HELP"].nil? && !doc["MODULE"][0]["MORE_HELP"][0].nil? && doc["MODULE"][0]["MORE_HELP"][0].length >0
	  		md +=doc["MODULE"][0]["MORE_HELP"][0]
	  	end
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
md='<div id="' + property + 'Usage" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
md+='  <div class="modal-header">'
md+='    <h3 id="myModalLabel">' + model + '.' + property + '</h3>'
md+='  </div>'
md+='  <div class="modal-body">'

  	md += "\n\n<strong>Ruby Usage</strong>"
  	md += "\n\n<pre class='CodeRay'><code>:::ruby\n"
  	if !ro
	  	md += "# Setting directly"
	  	md += "\n"
	  	md += "Rho::#{model}.#{property}=#{defval}"
	  	if propbag
		  	md += "\n# Setting one property"
		  	md += "\n"
		  	md += "Rho::#{model}.setProperty " + ":#{property}, #{defval} "
		  	md += "\n# Setting multiple properties using HASH"
		  	md += "\n"
	  		md += "Rho::#{model}.setProperties { " + ":#{property} => #{defval} , :another_property => #{defval}}"
  		end
  	end
  	if propbag
	  	md += "\n\n# Getting one property"
	  	md += "\n"
	  	md += "myvar = Rho::#{model}.getProperty(" + "'#{property}')"
	  	md += "\n# Getting multiple properties"
	  	md += "\n"
	  	md += "myvar = Rho::#{model}.getProperties([" + "'#{property}' , 'another_property'])"
 	else
  		md += "myvar = Rho::#{model}.#{property}"
	
  	end
  	md += "</code></pre>" 
  	md += "\n\n<strong>Javascript Usage</strong>"
  	md += "\n\n<pre class='CodeRay'><code>:::javascript\n"
  	if !ro
	  	md += "\n# Setting directly"
	  	md += "\n"
	  	md += "Rho.#{model}.#{property}=#{defval};"
	  	if propbag
		  	md += "\n# Setting one property"
		  	md += "\n"
		  	md += "Rho.#{model}.setProperty(" + "'#{property}',#{defval});"
		  	md += "\n# Setting multiple properties using JSON object"
		  	md += "\n"
		  	md += "Rho.#{model}.setProperties({ " + ":#{property}:#{defval} , :another_property:#{defval}});"
		end
  	end 
  	if propbag
	  	md += "\n\n# Getting one property"
	  	md += "\n"
	  	md += "myvar = Rho.#{model}.getProperty(" + "'#{property}');"
	  	md += "\n# Getting multiple properties"
	  	md += "\n"
	  	md += "myvar = Rho.#{model}.getProperties([" + "'#{property}' , 'another_property']);"
	else
	  	md += "myvar = Rho.#{model}.#{property};"

	end
	md += "</code></pre>" 
md+='  </div>'
md+='  <div class="modal-footer">'
md+='    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>'
md+='  </div>'
md+='</div>'
  	
  	return md
  end

  def self.getexamplelinks(doc)
  	md = ""
  	ctr = 0
  	if !doc["MODULE"][0]["EXAMPLES"].nil? && !doc["MODULE"][0]["EXAMPLES"][0]["EXAMPLE"].nil?
	  	s=doc["MODULE"][0]["EXAMPLES"][0]["EXAMPLE"]
	  	ctr = s.count()
	  	s.each_with_index() { |element,index|
	  	md += '<li><a href="#e' + index.to_s + '" data-target="eExample' + index.to_s + '" class="autouncollapse">' + element['title'] + "</a></li>" 
		}
  	end
  	return { "md" => md, "count" => ctr}
  end

  def self.getremarklinks(doc)
  	md = ""
  	ctr = 0 
  	if !doc["MODULE"][0]["REMARKS"].nil? && !doc["MODULE"][0]["REMARKS"][0]["REMARK"].nil?
	  	s=doc["MODULE"][0]["REMARKS"][0]["REMARK"]
	  	ctr = s.count()
	  	s.each_with_index() { |element,index|
	  	md += '<li><a href="#r' + index.to_s + '" data-target="rRemark' + index.to_s + '" class="autouncollapse">' + element['title'] + "</a></li>" 
		}
  	end
  	return {"md" => md, "count" => ctr}
  end


  def self.getpropertieslinks(doc)
  	md = ""
  	ctr =0
  	groupctr = 0
  	if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].nil?
	  	s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}
	  	ctr = s.count()
	  	# md += "<ul>"
	  	s.each() { |element|
	  		if element["generateDoc"].nil? || element["generateDoc"] == "true"

				propreplaces = ""
				deprecated = ""
				#puts doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0].empty?
				#Check to see if need to add to description about this method replacing a deprecated one
				if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"].nil?  && !doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0].empty?
			    	doc["MODULE"][0]["PROPERTIES"][0]["ALIASES"][0]["ALIAS"].each() { |a|
						#puts a
						if a["existing"] == element["name"]
							propreplaces += a["new"]
						end
						if !element["deprecated"].nil?
							deprecated = element["deprecated"]
						end
					}
				end
				
		  		propdisplayname = element["name"]
			  	if propreplaces != ""
						#methname = methname + " <span class='pull-right label label-info'>Replaces:#{methreplaces}</span>"
						# @methdesc = " <span class='label label-info'>Replaces:#{methreplaces}</span>" + @methdesc
						propdisplayname = '<span class="text-info">' + element["name"] + '</span>'

				end
				if deprecated == "true"
		  			propdisplayname = "<span class='text-error'>" + element["name"] + "</span>"
				end
			  	
					groupctr +=1
					if groupctr == 36
						# md+="</ul><ul>"
						groupctr = 0
					end
			  		md += '<li><a href="#p' + element["name"] + '" data-target="cProperty' + element["name"] + '" class="autouncollapse">' + propdisplayname + "</a></li>" 
	  		end
		}
		# md += "</ul>"
  	end
  	return { "md" => md, "count" => ctr}
  end

  def self.getmethodslinks(doc)
  	md = ""
  	ctr = 0 
  	if !doc["MODULE"][0]["METHODS"].nil?
	  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]} rescue {}
	  	ctr = s.count()
	  	s.each() { |element|
	  		if element["generateDoc"].nil? || element["generateDoc"] == "true"
	 
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
			end
		}
  	end
  	return { "md" => md, "count" => ctr}
  end

  def self.getexamples(doc)
  	md = ""
  	# puts doc["MODULE"][0]["EXAMPLES"]
  	if !doc["MODULE"][0]["EXAMPLES"].nil? && !doc["MODULE"][0]["EXAMPLES"][0]["EXAMPLE"].nil?
	  	s=doc["MODULE"][0]["EXAMPLES"][0]["EXAMPLE"]
	  	s.each_with_index() { |element,index|
	  		examplename = ""
  			examplesections = ""
	  		examplename = element["title"]
	  		sect=element["SECTIONS"][0]["SECTION"]
	  		sect.each_with_index() { |section,si|
	  			#puts "**********"
	  			#puts section
	  			examplesections += "\n"
	  			# puts section["DESC"][0]
	  			# if section["DESC"][0].class != Hash
	  			# puts section
	  				if !section["DESC"].nil? && !section["DESC"][0].nil?
						examplesections += section["DESC"][0]
					end
				# end
				exampleid = "exI#{index.to_s}-S#{si.to_s}"
	  			
				codelang = 'ruby'
	  			codesnip = section["CODE"]
	  			codejs = ''
	  			coderuby = ''
	  			# puts codesnip
	  			if !codesnip[0]["content"].nil? #uses one code block
	  			 # puts codesnip
	  			 if !codesnip[0]["lang"].nil?
	  			 	codelang = codesnip[0]["lang"]
	  			 	if codelang.empty?
	  			 		codelang = 'ruby'
	  			 	end
	  			 end
	  			 if codelang == 'ruby'
	  			 	coderuby = "<pre class='CodeRay'><code>:::#{codelang}"
		  			cleanCode = codesnip[0]["content"].gsub('<','&lt;')
		  			cleanCode = cleanCode.gsub('>','&gt;')
		  			coderuby += cleanCode
					coderuby += "</code></pre>"
	  			 else
	  			 	codejs = "<pre class='CodeRay'><code>:::#{codelang}"
		  			cleanCode = codesnip[0]["content"].gsub('<','&lt;')
		  			cleanCode = cleanCode.gsub('>','&gt;')
		  			codejs += cleanCode
					codejs += "</code></pre>"
	  			 end
	  			else
	  			 if !codesnip[0]["RUBY"].nil?
	  			 	coderuby = "<pre class='CodeRay'><code>:::ruby\n"
		  			cleanCode = codesnip[0]["RUBY"][0].gsub('<','&lt;')
		  			cleanCode = cleanCode.gsub('>','&gt;')
		  			coderuby += cleanCode
					coderuby += "</code></pre>"
	  			 end
	  			 if !codesnip[0]["JAVASCRIPT"].nil?
	  			 	codejs = "<pre class='CodeRay'><code>:::javascript\n"
		  			cleanCode = codesnip[0]["JAVASCRIPT"][0].gsub('<','&lt;')
		  			cleanCode = cleanCode.gsub('>','&gt;')
		  			codejs += cleanCode
					codejs += "</code></pre>"
	  			 end

	  			end
	  			
				exampletabs = "<ul class='nav nav-tabs' id='#{exampleid}Tab'>"
				activeindicator = "class='active'"
				if codejs != ''
					exampletabs +=  "<li #{activeindicator}><a href='##{exampleid}JS' data-toggle='tab'>Javascript</a></li>"
					activeindicator = ''
				end
				if coderuby != ''
					exampletabs +=  "<li #{activeindicator}><a href='##{exampleid}RUBY' data-toggle='tab'>Ruby</a></li>"
				end
				exampletabs += "</ul>"

				activeindicator = "class='tab-pane active'"
				
				extabcontent = "<div class='tab-content'>"
				exJSTabcontent = ''
				exRubyTabcontent = ''
				if codejs != ''
					exJSTabcontent = "<div #{activeindicator} id='#{exampleid}JS'>#{codejs}</div>"
					activeindicator = "class='tab-pane'"
				end
				if coderuby != ''
					exRubyTabcontent = "<div #{activeindicator} id='#{exampleid}RUBY'>#{coderuby}</div>"
				end
				

				extabcontent += exJSTabcontent + exRubyTabcontent + "</div>"
				
				examplesections += exampletabs
	  			examplesections += extabcontent

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
  	if !doc["MODULE"][0]["REMARKS"].nil? && !doc["MODULE"][0]["REMARKS"][0]["REMARK"].nil?
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

  def self.getplatformindicators (platforms,msionly,rubyonly)
  	indicators = ""
  	if !rubyonly
		indicators += '<img src="/public/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Javascript">'
	end
	indicators += '<img src="../img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">'
	if !platforms.downcase.index('android').nil? || !platforms.downcase.index('all').nil?
		indicators += '<img src="../img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android">'
  	end
  	if (!platforms.downcase.index('ios').nil? || !platforms.downcase.index('all').nil?) && !msionly
		indicators += '<img src="/public/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">'
  	end
  	if !platforms.downcase.index('wm').nil? || !platforms.downcase.index('all').nil?
		indicators += '<img src="../img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">'
  	end
  	if !platforms.downcase.index('wp8').nil? || !platforms.downcase.index('all').nil?
		indicators += '<img src="../img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8">'
  	end
  	if (!platforms.downcase.index('win32').nil? || !platforms.downcase.index('all').nil?) && !msionly
		indicators += '<img src="../img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop">'
  	end
  	if msionly
		indicators += '<img src="../img/motowebkit.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Motorola Devices Only">'
	end
	
  	return indicators		
  end

  #returns Markdown for the <Properties section
  def self.getproperties(doc)
  	md = ""
  	generateAccessors = true

	templatePropBag = false
	  	if !doc["MODULE"][0]["TEMPLATES"].nil? && !doc["MODULE"][0]["TEMPLATES"][0].nil? && !doc["MODULE"][0]["TEMPLATES"][0]["PROPERTY_BAG"].nil?
	  		templatePropBag = true
	  	end

  	if !doc["MODULE"][0]["TEMPLATES"].nil? && doc["MODULE"][0]["TEMPLATES"][0]["PROPERTY_BAG"].nil?
  		templatePropBag = false
  	end
  	if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["generateAccessors"].nil? && doc["MODULE"][0]["PROPERTIES"][0]["generateAccessors"] == "false"
  		generateAccessors = false
  	end
  	if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].nil?
  		s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}

	  	# a = doc.elements.each("//PROPERTIES/PROPERTY").to_a.sort {|x,y| x["name"].to_s y["name"].to_s}
	  	# puts a
		s.each() { |element|
			if element["generateDoc"].nil? || element["generateDoc"] == "true"
 
			propname = element["name"]
			propusage = ""
			propver = ""
			propnote = ""
			# type is optional default is STRING
			 #puts element
			if !element["VER_INTRODUCED"].nil?
				propver= "<span class='muted pull-right'>" + element["VER_INTRODUCED"][0] + "</span>"
				
			end
			msionly = false
			rubyonly = false	
			if !element["APPLIES"].nil? 

				appliescontent = ""
				# puts element["APPLIES"]
				if !element["APPLIES"][0]["msiOnly"].nil?
					if element["APPLIES"][0]["msiOnly"] == "true"
						msionly = true
					end
				end
				if !element["APPLIES"][0]["rubyOnly"].nil?
					if element["APPLIES"][0]["rubyOnly"] == "true"
						rubyonly = true
					end
				end
				if !element["APPLIES"][0]["content"].nil?
					appliescontent = element["APPLIES"][0]["content"]	
				end	
				# propnote= "\n<table class='note'>\n<td class='icon'></td><td class='content'>Applies to: " + element["APPLIES"][0] + "</td>\n</table>\n\n"
				# puts appliescontent
				if appliescontent.size >0
					propnote= "(" + appliescontent + ")"
				end
			end
			@propplatforms = "All"
			if !element["PLATFORM"].nil?
				@propplatforms = element["PLATFORM"][0]
			end
			@propplatforms = getplatformindicators(@propplatforms,msionly,rubyonly)
			@propsectionplatforms = "<div>"
			@propsectionplatforms += "<p>#{@propplatforms} #{propnote}</p></div>"
			
			
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
  	deprecated = ""
		if !element["deprecated"].nil?
			deprecated = element["deprecated"]
		end

  	if propreplaces != ""
			#methname = methname + " <span class='pull-right label label-info'>Replaces:#{methreplaces}</span>"
			# @methdesc = " <span class='label label-info'>Replaces:#{methreplaces}</span>" + @methdesc
			propdisplayname = '<span class="text-info">' + propname + '</span>'
			@propdesc = "<span class='label label-info'>Replaces:#{propreplaces}</span> " + @propdesc

	end
	if deprecated != ""
			#methname = methname + " <span class='pull-right label label-info'>Replaces:#{methreplaces}</span>"
			# @methdesc = " <span class='label label-info'>Replaces:#{methreplaces}</span>" + @methdesc
			propdisplayname = '<span class="text-error">' + propname + '</span>'
			@propdesc = "<span class='label label-important'>Deprecated</span> " + @propdesc

	end
  	md += "<a name='p#{propname}'></a><div class='accordion property' id='p"+ propname + "'>"
    md += '<div class="accordion-group">'
    md += '<div class="accordion-heading">'
    
    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cProperty' + propname + '">'
    md += '<strong>' + propdisplayname  + '</strong>' + "#{proptype} #{propreadOnly} #{propver}"
	md += '<i class="icon-chevron-down pull-right"></i></span>'
    md += '</div>'
    md += '<div id="cProperty' + propname + '" class="accordion-body collapse in">'
    md +='  <div class="accordion-inner">'

  	md += "#{@propdesc}"
    md += getparams(element,true)
  	md += "#{propdefault}"
  	# puts element["PARAM"]
  	if !generateAccessors
  		md += '<p>This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.</p>'
	else
  		# md += '<p><a href="#' + propname + 'Usage" class="btn" data-toggle="modal" title="View Usage">View Usage</a></p>'
	end
  	md += @propvalues
  	 if generateAccessors
  		# md += "<p>" + propusage + "</p>"
  	 end
    md += "#{@propsectionplatforms}  </div>"
    md += '</div>'
    md += '</div>'
	md += '</div>'
			end
	  	}
	end
  	return md
  end

def self.getparams(element,toplevel)
	@seperator = ""
		
	#puts element
	methparamsdetails = ""
	methsectionparams = ""
		if !element["PARAMS"].nil?
			if !toplevel
				methsectionparams += "<ul>"
			end
			element["PARAMS"].each { |params|
				params["PARAM"].each { |param|
					methparamsdetailsdesc = ''
			
					# puts param
					if !param["DESC"].nil?
						methparamsdetailsdesc=param["DESC"][0]
						if methparamsdetailsdesc.to_s == '{}'
							methparamsdetailsdesc= ''
						end
					end

					methparamsnil=""
					methparamsnildesc=""
					if !param["CAN_BE_NIL"].nil?
						param["CAN_BE_NIL"].each { |paramsnil|
							methparamsnil=" <span class='label label-info'>Optional</span>"
							if !paramsnil["DESC"].nil?
								methparamsnildesc =  paramsnil["DESC"][0]
							end
							
						}
					end
					
					if param["type"].nil?
						param["type"] = "STRING"
					end
					if toplevel

						@methparams += @seperator + '<span class="text-info">' + param["type"] + "</span> " + param["name"]
						@seperator =  ', '
					end 
					# puts param
					if param["name"].nil?
						param["name"] = ""
					end
					methparamsdetails += "<table><tr><td>" + param["name"] + "</td><td>" + param["type"] + "</td><td>" + methparamsdetailsdesc + "</td><td>" + methparamsnil + "</td></tr></table>"
					values = ""
					valuetype = param["type"]
								
					if !param["VALUES"].nil?
						param["VALUES"].each() { |velement|
							velement["VALUE"].each() { |vaelement|
								valdesc = "<dl>"
								if !vaelement["DESC"].nil?
									if !vaelement["DESC"][0].empty?
										valdesc = vaelement["DESC"][0].to_s
									else
										valdesc = ""
									end 
								end	
								@seperator = ', '
								if !vaelement["type"].nil?
									valuetype = !vaelement["type"]
								end
								values += "<dt>#{vaelement["value"]}</dt><dd>#{valdesc}</dt>" 
								
							}
						values += "</dl>"

						}
					end
					if values != ""
						values = "<p><strong>Possible Values</strong> :</p> " + values 
					end
					
					methsectionparams += "<li>" + param["name"] + " : <span class='text-info'>" + param["type"] + "</span>#{methparamsnil}<p>" + methparamsdetailsdesc + " " + methparamsnildesc + "</p>#{values}</li>"
					methsectionparams += getparams(param,false)
				}

			}




			if !toplevel
				methsectionparams += "</ul>"
			end
			
			
		end

if !element["PARAM"].nil?
			if !toplevel
				methsectionparams += "<ul>"
			end
				element["PARAM"].each { |param|
					methparamsdetailsdesc = ''
			
					# puts param
					if !param["DESC"].nil?
						methparamsdetailsdesc=param["DESC"][0]
						if methparamsdetailsdesc.to_s == '{}'
							methparamsdetailsdesc= ''
						end
					end

					methparamsnil=""
					methparamsnildesc=""
					if !param["CAN_BE_NIL"].nil?
						param["CAN_BE_NIL"].each { |paramsnil|
							methparamsnil=" <span class='label label-info'>Optional</span>"
							if !paramsnil["DESC"].nil?
								methparamsnildesc =  paramsnil["DESC"][0]
							end
							
						}
					end
					
					if param["type"].nil?
						param["type"] = "STRING"
					end
					if param["name"].nil?
						param["name"] = "<i>Object<i>"
					end

					# puts param
					if param["name"].nil?
						param["name"] = ""
					end
					methparamsdetails += "<table><tr><td>" + param["name"] + "</td><td>" + param["type"] + "</td><td>" + methparamsdetailsdesc + "</td><td>" + methparamsnil + "</td></tr></table>"
					values = ""
					valuetype = param["type"]
								
					if !param["VALUES"].nil?
						param["VALUES"].each() { |velement|
							velement["VALUE"].each() { |vaelement|
								valdesc = "<dl>"
								if !vaelement["DESC"].nil?
									if !vaelement["DESC"][0].empty?
										valdesc = vaelement["DESC"][0].to_s
									else
										valdesc = ""
									end 
								end	
								@seperator = ', '
								if !vaelement["type"].nil?
									valuetype = !vaelement["type"]
								end
								values += "<dt>#{vaelement["value"]}</dt><dd>#{valdesc}</dt>" 
								
							}
						values += "</dl>"

						}
					end
					if values != ""
						values = "<p><strong>Possible Values</strong> :</p> " + values 
					end
					
					methsectionparams += "<li>" + param["name"] + " : <span class='text-info'>" + param["type"] + "</span>#{methparamsnil}<p>" + methparamsdetailsdesc + " " + methparamsnildesc + "</p>#{values}</li>"
					methsectionparams += getparams(param,false)
				}

			



			
			if !toplevel
				methsectionparams += "</ul>"
			end
			
			
		end

	return methsectionparams
end

#returns Markdown for the <Properties section
  def self.getmethods(doc)
  	#puts "********************* METHODS *************"
	#puts doc["MODULE"][0]["METHODS"][0]
  	md = ""

  	
  	@methsectionparams= ""
  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]} rescue {}
    
    #puts methodaliases
		
	s.each() { |element| 
		if element["generateDoc"].nil? || element["generateDoc"] == "true"
	
		 #puts element["name"]
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
		
		if !element["DESC"].nil?
			@methdesc = element["DESC"][0]
		else
			@methdesc = ""
		end
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
		methreturnparams = ""
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
				methreturnparams =  getparams(relement,false)
			}
		end
		@methplatforms = "All"
		if !element["PLATFORM"].nil?
			@methplatforms = element["PLATFORM"][0]
		end
		msionly = false
		rubyonly = false
		methnote = ""		
		if !element["APPLIES"].nil? 

				appliescontent = ""
				# puts element["APPLIES"]
				if !element["APPLIES"][0]["msiOnly"].nil?
					if element["APPLIES"][0]["msiOnly"] == "true"
						msionly = true
					end
				end
				if !element["APPLIES"][0]["rubyOnly"].nil?
					if element["APPLIES"][0]["rubyOnly"] == "true"
						rubyonly = true
					end
				end
				if !element["APPLIES"][0]["content"].nil?
					appliescontent = element["APPLIES"][0]["content"]	
				end	


			# propnote= "\n<table class='note'>\n<td class='icon'></td><td class='content'>Applies to: " + element["APPLIES"][0] + "</td>\n</table>\n\n"
			# puts appliescontent
			if appliescontent.size >0
				
				methnote= "(" + appliescontent + ")"
			end

		end


		@methplatforms = getplatformindicators(@methplatforms,msionly,rubyonly)
			
		@methsectionplatforms = "<div>"
		@methsectionplatforms += "<p>#{@methplatforms}#{methnote}</p></div>"
		
		@methsectionreturns = "<div>"
		@methsectionreturns += "<p><strong>Return:</strong></p><ul>"
		@methsectionreturns += "<li>#{@methreturn}#{@methreturndesc}#{methreturnparams}</li></ul></div>"
			
		@methparams = ""
		@methparamsdetails = ""
		@methsectionparams = ""
		if !element["PARAMS"].nil? || (@methhascallback !="" && @methhascallback != "none")
			@methsectionparams = "<div>"
			@methsectionparams += "<p><strong>Parameters</strong></p><ul>"
		
			@methsectionparams += getparams(element,true)
		#add generic syntax for callback param
			if @methhascallback !="" && @methhascallback != "none"
				# puts element["CALLBACK"]
				
				@methcallbackoptional= ""
				if @methhascallback == "optional"
					@methcallbackoptional = " <span class='label label-info'>Optional</span> "
				end
				if @methhascallback == "mandatory"
					@methcallbackoptional = " <span class='label label-warning'>Mandatory</span> "
				end
				firstcallbackreturnparam = "calbackreturnparamname"
				if !element["CALLBACK"].nil? && !element["CALLBACK"][0]["type"].nil?
				
					callbacktype = element["CALLBACK"][0]["type"]
				else
					callbacktype = "OBJECT"
				end
				if !element["CALLBACK"].nil? && !element["CALLBACK"][0]["PARAMS"].nil?
					# puts element["CALLBACK"][0]["PARAMS"]
					firstcallbackreturnparam = element["CALLBACK"][0]["PARAMS"][0]["PARAM"][0]["name"]
				end
				if !element["PARAMS"].nil?
					prevparams = "...,"
				else
					prevparams = ""
				end
				@methcallbackparamdesc = '<p><a href="#' + methname + 'Usage" class="btn" data-toggle="modal" title="View Usage">View Usage</a></p>'
	
				@methcallbackparamdesc +='<div id="' + methname + 'Usage" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
				@methcallbackparamdesc+='  <div class="modal-header">'
				@methcallbackparamdesc+='    <h3 id="myModalLabel">' + methname + ' Callback</h3>'
				@methcallbackparamdesc+='  </div>'
				@methcallbackparamdesc+='  <div class="modal-body">'

				@methcallbackparamdesc += "<p>The callback parameter can take on one of three forms</p><ol>"
				@methcallbackparamdesc += "<li>Controller action URL"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc) + ".#{methname}(#{prevparams}" + " url_for :action => :mycallback)</code></pre>"
				@methcallbackparamdesc += "<p>Javascript</p>\n<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc) + ".#{methname}(#{prevparams}" + "'/app/model/mycallback');</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Anonymous function:"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc) + ".#{methname}(#{prevparams}" + "lambda{ |e|\n puts e['#{firstcallbackreturnparam}'] }\n)</code></pre>"
				@methcallbackparamdesc += "<p>Javascript</p>\n<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc) + ".#{methname}(#{prevparams}" + "function(e){\n//Your code here\n alert(e.#{firstcallbackreturnparam});\n};);</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Function"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc) + ".#{methname}(#{prevparams}" + " mycallback() )</code></pre>"
				@methcallbackparamdesc += "<p>Javascript</p>\nok	<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc) + ".#{methname}(#{prevparams}" + " mycallback());</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "</ol>"
				@methcallbackparamdesc+='  </div>'
				@methcallbackparamdesc+='  <div class="modal-footer">'
				@methcallbackparamdesc+='    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>'
				@methcallbackparamdesc+='  </div>'
				@methcallbackparamdesc+='</div>'

				# @methsectionparams += "<li>callback : <span class='text-info'>#{callbacktype}</span>#{@methcallbackoptional}<p>#{@methcallbackparamdesc}" +  "</p></li>"
				 @methsectionparams += "<li>callback : <span class='text-info'>#{callbacktype}</span>#{@methcallbackoptional}</li>"

  			end
  			@methsectionparams += "</ul></div>"
			
  		end
		@seperator = ""
		@methsample = "<b>" + getApiName(doc) + ".#{methname}(#{@methparams})</b><br/>"
		if @methparams != ""
			# @methvalues = "<br/><b>Possible Values:</b> " + @methvalues
		end
		if @methhascallback !="" && @methhascallback != "none"
			@callbackrubysample = "url_for :action => :take_callback"
			@callbackjssample = "callback_function"
			if @methparams != ""
				@methparams = @methparams + ", <span class='text-info'>#{callbacktype}</span> callback"
			else
				@methparams = @methparams + "<span class='text-info'>#{callbacktype}</span> callback"

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
			@methdesc = "<span class='label label-important'>Deprecated</span> " + @methdesc
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
			
			if !element["CALLBACK"].nil? && !element["CALLBACK"][0].nil?
				@methsectioncallbackparams = "<div>"
				@methsectioncallbackparams += "<p><strong>Callback Returning Parameters</strong></p><ul>"
			
				# element["CALLBACK"][0]["PARAMS"].each { |params|
				# 	params["PARAM"].each { |param|

				# 		if !param["DESC"].nil? && !param["DESC"][0].nil?
				# 			@methcallbackdetailsdesc=param["DESC"][0]
				# 		else
				# 			@methcallbackdetailsdesc= ''
				# 		end
				# 		if @methcallbackdetailsdesc.class == Hash
				# 			@methcallbackdetailsdesc = ''
				# 		end

						
						
				# 		if param["type"].nil?
				# 			param["type"] = "STRING"
				# 		end
				# 		if !param["deprecated"].nil?  && param["deprecated"]== "true"
				# 			param["name"] = '<span class="text-error">' + param["name"] + '</span>'
			
				# 			param["type"] += " <span class='label label-important'>deprecated</span> "
				# 		end
				# 		# puts param
				# 		# puts param["name"]
				# 		# puts param["type"]
				# 		# puts @methcallbackdetailsdesc
						
				# 		@methcallbackdetails += "<tr><td>" + param["name"] + "</td><td>" + param["type"] + "</td><td>" + @methcallbackdetailsdesc + "</td></tr>"
				# 		@methsectioncallbackparams += "<li>" + param["name"] + " : <span class='text-info'>" + param["type"] + "</span><p>" + @methcallbackdetailsdesc + "</p></li>"
				# 	values = ""
				# 	valuetype = param["type"]
								
				# 	if !param["VALUES"].nil?
				# 		param["VALUES"].each() { |velement|
				# 			velement["VALUE"].each() { |vaelement|
				# 				valdesc = "<dl>"
				# 				if !vaelement["DESC"].nil?
				# 					if !vaelement["DESC"][0].empty?
				# 						valdesc = vaelement["DESC"][0].to_s
				# 					else
				# 						valdesc = ""
				# 					end 
				# 				end	
				# 				@seperator = ', '
				# 				if !vaelement["type"].nil?
				# 					valuetype = !vaelement["type"]
				# 				end
				# 				values += "<dt>#{vaelement["value"]}</dt><dd>#{valdesc}</dt>" 
								
				# 			}
				# 		values += "</dl>"

				# 		}
				# 	end
				# 	if values != ""
				# 		values = "<p><strong>Possible Values</strong> :</p> " + values 
				# 	end
				# 	@methsectioncallbackparams += values

				# 	}

				# }
				@methsectioncallbackparams += getparams(element["CALLBACK"][0],false)
				@methsectioncallbackparams += "</ul></div>"
			end  			
  			# md += @methcallbackdetails
  			# md += "</table></td></tr>"

  		end
  		# md += "</tr></table>\n\n" 
  		
  	if !element["BACKWARDS_COMPATIBILITY"].nil?
  		@methdesc += "\n\nNOTE: #{element["BACKWARDS_COMPATIBILITY"][0]["DESC"][0]}\n\n"
	end		
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
  	md += @methsectioncallbackparams
    md += @methsectionreturns
  	md += @methsectionplatforms
  	md += '  </div>'
    md += '</div>'
    md += '</div>'
	md += '</div>'
		end 
  	}

  	return md
  end


  def self.markdown(topic)
    md = ''

  	# xml = File.read(topic)
  	# doc = REXML::Document.new xml
  	
  	# puts topic
  	doc = XmlSimple.xml_in(topic)
  	if doc["MODULE"][0]["generateDoc"].nil? || doc["MODULE"][0]["generateDoc"] == "true"
	  	templatePropBag = false
	  	if !doc["MODULE"][0]["TEMPLATES"].nil? && !doc["MODULE"][0]["TEMPLATES"][0].nil? && !doc["MODULE"][0]["TEMPLATES"][0]["PROPERTY_BAG"].nil?
	  		templatePropBag = true
	  	end
	  	templateDefault = false
	  	if !doc["MODULE"][0]["TEMPLATES"].nil? && !doc["MODULE"][0]["TEMPLATES"][0].nil? && !doc["MODULE"][0]["TEMPLATES"][0]["DEFAULT_INSTANCE"].nil?
	  		templateDefault = true
	  	end
	  	templateSingleton = false
	  	if !doc["MODULE"][0]["TEMPLATES"].nil? && !doc["MODULE"][0]["TEMPLATES"][0].nil? && !doc["MODULE"][0]["TEMPLATES"][0]["SINGLETON_INSTANCES"].nil?
	  		templateSingleton = true
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
	  		puts topic + 'trying to use singleton'
	  		# This was commented out as engineering changed their minds on singleton usage no longer used
	  		# it use to be just enumerate, but now that is in indicidual api docs

	  		# singletondoc = XmlSimple.xml_in('docs/api/singleton_instances.xml')
			# singletondoc["METHODS"][0]["METHOD"].each { |m|
				# doc["MODULE"][0]["METHODS"][0]["METHOD"].push(m)
			# }
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
	  	if proplinks["count"]>0
		  	md += '<div class="btn-group">'
		  	md += ''
		  	md += '<a href="#Properties" class="btn"><i class="icon-list"></i> Properties<sup>&nbsp;' + proplinks["count"].to_s + '</sup></a>'
		    md += '<button href="#" class="btn dropdown-toggle" data-toggle="dropdown">'
		    md += '  <span class="caret"></span>&nbsp;'
		    md += '</button>'
		    md += '<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">'
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
		    md += proplinks["md"]
		    md += '</ul>'
		  	md += '</div>'
	  	end 
	  	if methlinks["count"]>0
		  	md += '<div class="btn-group">'
		    md += '<a href="#Methods" class="btn"><i class="icon-cog"></i> Methods<sup>&nbsp;' + methlinks["count"].to_s + '</sub></a>'
		    md += '<a class="btn dropdown-toggle" data-toggle="dropdown" data-target="#" href="#Methods" >'
		    md += '  <span class="caret"></span>&nbsp;'
		    md += '</a>'
		    md += '<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">'
		    md += methlinks["md"]
		    md += '</ul>'
		  	md += '</div>'
			md += '<div class="btn-group pull-right">'
		    md += '<button class="btn" id="expandAll" data-toggle="tooltip" title="Expand/Collapse all"><i class="icon-th-list "></i>&nbsp;</button>'
		  	md += '</div>'
	  	end
	  	if remarklinks["count"]>0
		  	md += '<div class="btn-group">'
		  	md += ''
		  	md += '<a href="#Remarks" class="btn"><i class="icon-warning-sign"></i> Remarks<sup>&nbsp;' + remarklinks["count"].to_s + '</sup></a>'
		    md += '<button href="#" class="btn dropdown-toggle" data-toggle="dropdown">'
		    md += '  <span class="caret"></span>&nbsp;'
		    md += '</button>'
		    md += '<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">'
		    md += remarklinks["md"]
		    md += '</ul>'
		  	md += '</div>'
	  	end 
		if examplelinks["count"]>0
		  	md += '<div class="btn-group">'
		  	md += ''
		  	md += '<a href="#Examples" class="btn"><i class="icon-edit"></i> Examples<sup>&nbsp;' + examplelinks["count"].to_s + '</sup></a>'
		    md += '<button href="#" class="btn dropdown-toggle" data-toggle="dropdown">'
		    md += '  <span class="caret"></span>&nbsp;'
		    md += '</button>'
		    md += '<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">'
		    md += examplelinks["md"]
		    md += '</ul>'
		  	md += '</div>'
	  	end 
	  	md += '<div  >'

	  	md += "\n" + getApiDesc(doc) + "\n" 
	  	if docexamples !=""
		  	 md += "\n<a name='Examples'></a>\n<h2><i class='icon-edit'></i>Examples</h2>" + "\n\n" 
		  	 md += "" + docexamples + ""
	  	end 
	  	if docproperties !=""
		  	 md += "\n<a name='Properties'></a>\n<h2><i class='icon-list'></i>Properties</h2>" + "\n\n" 
				if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["generateAccessors"].nil? && doc["MODULE"][0]["PROPERTIES"][0]["generateAccessors"] == "false"
			  		md += "\n\nNOTE: The properties of this API Class cannot be accessed via setter or getter methods. However they can be used in methods that allow a HASH or Array of properties to be passed in.\n\n"
				end
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
	else
		puts ('Skipping Undocumented API: ' + doc["MODULE"][0]["name"] )
	end
  return md
  end


def self.analyze(topic)
    md = ''

  	# xml = File.read(topic)
  	# doc = REXML::Document.new xml
  	
  	doc = XmlSimple.xml_in(topic)
  	# puts 'Analyzing: ' + doc["MODULE"][0]["name"]
  	apiname = doc["MODULE"][0]["name"]
  	# puts '    Checking Methods'
  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]} rescue {}
    
    #puts methodaliases
		
	s.each() { |element|
		methodname = element["name"]
		# puts '        ' + element["name"]
		if !element["hasCallback"].nil? && element["hasCallback"] != "none"
		
			# puts '            callback: ' + element["hasCallback"]
			if !element["CALLBACK"].nil? && !element["CALLBACK"][0]["PARAMS"].nil?
				
				element["CALLBACK"][0]["PARAMS"].each { |params|
				}
			else

				if !element["RETURN"].nil?
					hasReturn = " Has return"
				else
					hasReturn = " NO RETURN"
				end
				puts "#{apiname}.#{methodname}: NO CALLBACK PARAMS - Callback:#{element['hasCallback']} #{hasReturn}"

			end
		end 
	}
  end
	

	
end
