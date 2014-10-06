require 'xmlsimple'
require 'rdiscount'

class Api

@@apiName = ""

  def self.getMDDesc(desc)
  	if desc.is_a?(String)
  		return RDiscount.new(desc, :smart).to_html
  	else
  		return desc
  	end
  end

  def self.getElementName(element)
  	if !element["docNameOverride"].nil?
  		return element["docNameOverride"]
  	else
  		return element["name"]
  	end
  end

	#returns markdown for the name of the API 
  def self.getApiName(doc,lang,allowoverride)
  	md=""
  	docName = doc["MODULE"][0]["name"]
  	if !doc["MODULE"][0]["parent"].nil? && doc["MODULE"][0]["parent"] !="Rho"
  		docName = doc["MODULE"][0]["parent"].gsub('Rho.','') + '.' + doc["MODULE"][0]["name"]
  	end
  	md = docName 
  	if allowoverride
	  	if !doc["MODULE"][0]["docNameOverride"].nil?
	  		md = doc["MODULE"][0]["docNameOverride"]
	  	else
	  		if lang == 'RUBY'
	  			md = 'Rho::' + docName
	  		elsif lang =='JS'
	  			md = 'Rho.' + docName
	  		else
	  			md = docName

	  		end
	  	end
	end
  	# if !doc["MODULE"][0]["ALIASES"].nil? && !doc["MODULE"][0]["ALIASES"][0]["ALIAS"].nil?
  	# 	if doc["MODULE"][0]["ALIASES"][0]["ALIAS"][0]["existing"].nil?
  	# 		md = doc["MODULE"][0]["ALIASES"][0]["ALIAS"][0]["new"]
  	# 		puts 'using alias'
  	# 	end
  	# end
  	# if md == 'SignalIndicators'
  		# md = 'Signal'
  	# end
  	# doc.elements.each("//MODULE") { |element| 
  	# 	md = element.attributes["name"] 
  	# }
  	@@apiName = md
  	return md
  end
 
  def self.getshortcut(e)
  	s = e["name"]
  	if !e["access"].nil?
  		s += e["access"]
  	end
  	return s
  end

 def self.getApiDesc(doc)
  	md=""
  	if !doc["MODULE"][0]["HELP_OVERVIEW"][0].nil? && doc["MODULE"][0]["HELP_OVERVIEW"][0].length >0

	  	md = RDiscount.new(doc["MODULE"][0]["HELP_OVERVIEW"][0], :smart).to_html
	  	if !doc["MODULE"][0]["MORE_HELP"].nil? && !doc["MODULE"][0]["MORE_HELP"][0].nil? && doc["MODULE"][0]["MORE_HELP"][0].length >0
	  		
	  		md +=RDiscount.new(doc["MODULE"][0]["MORE_HELP"][0], :smart).to_html
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
  		defval = "1"
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
# md='<div id="' + property + 'Usage" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
# md+='  <div class="modal-header">'
# md+='    <h3 id="myModalLabel">' + model + '.' + property + '</h3>'
# md+='  </div>'
# md+='  <div class="modal-body">'

  	md = "\n\n<strong>JavaScript Usage</strong>"
  	md += "\n\n<pre class='CodeRay'><code>:::javascript\n"
  	if !ro
	  	md += "\n// Setting directly"
	  	md += "\n"
	  	md += "Rho.#{model}.#{property}=#{defval};"
	  	if propbag
		  	md += "\n// Setting one property"
		  	md += "\n"
		  	md += "Rho.#{model}.setProperty(" + "'#{property}',#{defval});"
		  	md += "\n// Setting multiple properties using JSON object"
		  	md += "\n"
		  	md += "Rho.#{model}.setProperties({ " + "'#{property}':#{defval} , 'another_property':#{defval}});"
		end
  	end 
  	if propbag
	  	md += "\n\n// Getting one property"
	  	md += "\n"
	  	md += "myvar = Rho.#{model}.getProperty(" + "'#{property}');"
	  	md += "\n// Getting multiple properties"
	  	md += "\n"
	  	md += "myvar = Rho.#{model}.getProperties([" + "'#{property}' , 'another_property']);"
	else
		md += "\n\n// Getting "
	  	
	  	md += "\nmyvar = Rho.#{model}.#{property};"

	end
	md += "</code></pre>" 
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
 		md += "\n\n# Getting "
	  	
  		md += "\nmyvar = Rho::#{model}.#{property}"
	
  	end
  	md += "</code></pre>" 
# md+='  </div>'
# md+='  <div class="modal-footer">'
# md+='    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>'
# md+='  </div>'
# md+='</div>'
  	
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

def self.getconstantlinks(doc)
  	md = ""
  	ctr = 0 
  	if !doc["MODULE"][0]["CONSTANTS"].nil? && !doc["MODULE"][0]["CONSTANTS"][0]["CONSTANT"].nil?
	  	s=doc["MODULE"][0]["CONSTANTS"][0]["CONSTANT"]
	  	ctr = s.count()
	  	s.each_with_index() { |element,index|
	  	md += '<li><a href="#c' + index.to_s + '" data-target="rConstant' + index.to_s + '" class="autouncollapse">' + element['name'] + "</a></li>" 
		}
  	end
  	return {"md" => md, "count" => ctr}
  end


  def self.getpropertieslinks(doc)
  	md = ""
  	mdgroups = {}
  	ctr =0
  	groupctr = 0
  	if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].nil?
  		# puts(doc["MODULE"][0]["PROPERTIES"])
	  	s=doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].sort {|x,y| x["name"] <=> y["name"]}
	  	# ctr = s.count()
	  	# md += "<ul>"
	  	s.each() { |element|
	  		element["name"] = getElementName(element) 
		
	  		if element["generateDoc"].nil? || element["generateDoc"] == "true"
	  			ctr+=1
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
				if element["access"].nil? && element["scopeOverride"].nil?
						#use global PROPERTIES field
						propsAccess = doc["MODULE"][0]["PROPERTIES"][0]["access"]
				else
						if !element["scopeOverride"].nil?
							propsAccess = element["scopeOverride"]
						else
							propsAccess = element["access"]
						end

				end
				if propsAccess.nil? || propsAccess == 'INSTANCE' || propsAccess == ''
					menuGroupName = "Instance Properties"
					accesstype = '<i class="icon-file pull-right"></i>'

				else
					accesstype = '<i class="icon-book pull-right"></i>'
					menuGroupName = "Class Properties"
				end	
				
			  	md += '<li><a href="#p' + element["name"] + '" data-target="cProperty' + element["name"] + '" class="autouncollapse">' + propdisplayname + "#{accesstype}</a></li>" 
			  	if mdgroups[menuGroupName].nil?
			  		mdgroups[menuGroupName] = '<li><a href="#p' + element["name"] + '" data-target="cProperty' + element["name"] + '" class="autouncollapse">' + propdisplayname + "</a></li>"
			  	else
			  		mdgroups[menuGroupName] += '<li><a href="#p' + element["name"] + '" data-target="cProperty' + element["name"] + '" class="autouncollapse">' + propdisplayname + "</a></li>"
			  	end 
	  		end
		}
		# md += "</ul>"
  	end

  	submenus = ""
  	divider = ""
  	mdgroups.sort_by { |key, value| key }.each { |k,v| 
  		submenus += divider
  		submenus += '<li class="disabled"><a tabindex="-1" href="#"><b><i>' + k + '</i></b></a>' + v + '</li>'
  		divider = '<li class="divider"></li>'
  		 }
  	
  	return { "md" => submenus, "count" => ctr}
  end

  def self.getmethodslinks(doc)
  	md = ""
  	mdgroups = {}
  	
  	ctr = 0 
  	if !doc["MODULE"][0]["METHODS"].nil?
	  	s=doc["MODULE"][0]["METHODS"][0]["METHOD"].sort {|x,y| x["name"] <=> y["name"]} rescue {}
	  	
	  	s.each() { |element|
	  		element["name"] = getElementName(element) 
		
	  		if element["generateDoc"].nil? || element["generateDoc"] == "true"
	 			ctr+=1
	  			methname = element["name"]

		  		if !doc["MODULE"][0]["METHODS"].nil? && !doc["MODULE"][0]["METHODS"][0]["ALIASES"].nil?  && !doc["MODULE"][0]["METHODS"][0]["ALIASES"][0].empty?
		    	doc["MODULE"][0]["METHODS"][0]["ALIASES"][0]["ALIAS"].each() { |a|
					#puts a
					if a["existing"] == element["name"]
						methname = "&nbsp;<span class='text-info'>" + element["name"] + "</span>"
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
				methtype=''
				if element["access"].nil? && element["scopeOverride"].nil?
						#use global methods field
						methodsAccess = doc["MODULE"][0]["METHODS"][0]["access"]
				else
					if !element["scopeOverride"].nil?
						methodsAccess = element["scopeOverride"]
					else
						methodsAccess = element["access"]
					end
				end
				if methodsAccess.nil? || methodsAccess == 'INSTANCE' || methodsAccess == ''
					methtype = '<i class="icon-file pull-right"></i>'
					menuGroupName = "Methods - Instance"
					
				else
					methtype = '<i class="icon-book pull-right"></i>'
					menuGroupName = "Methods - Class"

				end
			  	if !element["constructor"].nil?
					if element["constructor"] == "true"
						methtype = '<i class="icon-book pull-right"></i>'
						menuGroupName = "Constructs"
						methname = "Constructor"
					end
			  	end
			  	if !element["destructor"].nil?
					if element["destructor"] == "true"
					    methtype = '<i class="icon-book pull-right"></i>'
						menuGroupName = "Constructs"
						methname = "Destructor"
					end
			  	end
		  		md += '<li><a href="#m' + getshortcut(element) + '" data-target="cMethod' + element["name"] + '" class="autouncollapse">' + methname + "#{methtype}</a></li>" 
				if mdgroups[menuGroupName].nil?
			  		mdgroups[menuGroupName] = '<li><a href="#m' + getshortcut(element) + '" data-target="cMethod' + element["name"] + '" class="autouncollapse">' + methname + "</a></li>" 
			  	else
			  		mdgroups[menuGroupName] += '<li><a href="#m' + getshortcut(element) + '" data-target="cMethod' + element["name"] + '" class="autouncollapse">' + methname + "</a></li>" 
			  	end
			end
		}
  	end
  	submenus = ""
  	divider = ""

  	mdgroups.sort_by { |key, value| key }.each { |k,v| 
  		submenus += divider
  		submenus += '<li class="disabled"><a tabindex="-1" href="#"><b><i>' + k + '</i></b></a>' + v + '</li>'
  		divider = '<li class="divider"></li>'
  		 }
  	return { "md" => submenus, "count" => ctr}
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
						examplesections += getMDDesc(section["DESC"][0])
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
					exampletabs +=  "<li #{activeindicator}><a href='##{exampleid}JS' data-toggle='tab'>JavaScript</a></li>"
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
	  	
			md += "<a name='e#{index.to_s}'></a><div class=' example' id='e"+ index.to_s + "'>"
		    md += '<div class="accordion-group">'
		    md += '<div class="accordion-heading">'
		    
		    md += '<span class="accordion-toggle"   href="#cExample' + index.to_s + '">'
		    md += '<strong>' + element["title"]  + '</strong>'
			# md += '<i class="icon-chevron-down pull-left"></i></span>'
		    md += '</div>'
		    md += '<div id="cExample' + index.to_s + '" class="accordion-body">'
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
	  		md += "<a name='r#{index.to_s}'></a><div class=' remarks' id='r"+ index.to_s + "'>"
		    md += '<div class="accordion-group">'
		    md += '<div class="accordion-heading">'
		    
		    md += '<span class="accordion-toggle"  href="#cRemark' + index.to_s + '">'
		    md += '<strong>' + element["title"]  + '</strong>'
			# md += '<i class="icon-chevron-down pull-left"></i></span>'
		    md += '</div>'
		    md += '<div id="cRemark' + index.to_s + '" class="accordion-body">'
		    md +='  <div class="accordion-inner">'
		    html = getMDDesc(element["DESC"][0])
		
		  	md += html
		  	md += '  </div>'
		    md += '</div>'
		    md += '</div>'
			md += '</div>'
	  	}

	end
	return md
  end

  def self.getconstants(doc)
  	md = ""
  	if !doc["MODULE"][0]["CONSTANTS"].nil? && !doc["MODULE"][0]["CONSTANTS"][0]["CONSTANT"].nil?
	  	s=doc["MODULE"][0]["CONSTANTS"][0]["CONSTANT"]
	  	md += '<div><dl  >'
	  	s.each_with_index() { |element,index|
	  		element["name"] = getElementName(element) 
		
	  		md += "<a name='c#{index.to_s}'></a>"
			md +=  "<dt>" + element["name"] + "</dt>"
			if !element["DESC"].nil? && !element["DESC"][0].is_a?(Hash)
 		        md +=  "<dd>" + getMDDesc(element["DESC"][0]) + "</dd>"
       		end
	  	}
	  	md += "</dl></div>"
	end
	return md
  end


  def self.getplatformindicators (platforms,msionly,ruby,javascript,usemoduleplatforms,doc)
  	if usemoduleplatforms
  		# puts 'using platform override' + doc["MODULE"][0]["name"]
  		if !doc["MODULE"][0]["PLATFORM"][0].nil?
  			platforms = doc["MODULE"][0]["PLATFORM"][0]
  			# puts platforms
  		end

  	end
  	indicators = ""
  	if javascript
			indicators += '<img src="/img/js.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="JavaScript">'
		end
		if ruby
			indicators += '<img src="/img/ruby.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Ruby">'
		end 
	if !platforms.is_a?(Hash)
		if !platforms.downcase.index('android').nil? || !platforms.downcase.index('all').nil?
			indicators += '<img src="/img/android.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Android">'
	  	end
	  	if (!platforms.downcase.index('ios').nil? || !platforms.downcase.index('all').nil?) && !msionly
			indicators += '<img src="/img/ios.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="iphone, ipod touch, ipad">'
	  	end
	  	if !platforms.downcase.index('wm').nil? || !platforms.downcase.index('all').nil?
			indicators += '<img src="/img/windowsmobile.png" style="height: 20px;padding-top: 8px" rel="tooltip" title="Windows Mobile, Windows CE, Windows Embedded">'
	  	end
	  	if !platforms.downcase.index('wp8').nil? || !platforms.downcase.index('all').nil?
			indicators += '<img src="/img/wp8.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Phone 8, Windows Embedded 8">'
	  	end
	  	if (!platforms.downcase.index('win32').nil? || !platforms.downcase.index('all').nil?) && !msionly
			indicators += '<img src="/img/windows.jpg" style="width: 20px;padding-top: 8px" rel="tooltip" title="Windows Desktop">'
	  	end
	  	if msionly
			indicators += '<img src="/img/motowebkit.png" style="width: 20px;padding-top: 8px" rel="tooltip" title="Motorola Devices Only">'
		end
	end	
  	return indicators		
  end

def self.getplatformindicatorsfilter (platforms,msionly,ruby,javascript)
  	indicators = ""
  	if javascript
		indicators += ' js'
	end
	if ruby
	
	indicators += ' ruby'
	end 
	if !platforms.downcase.index('android').nil? || !platforms.downcase.index('all').nil?
		indicators += ' android'
  	end
  	if (!platforms.downcase.index('ios').nil? || !platforms.downcase.index('all').nil?) && !msionly
		indicators += ' ios'
  	end
  	if !platforms.downcase.index('wm').nil? || !platforms.downcase.index('all').nil?
		indicators += ' wm'
  	end
  	if !platforms.downcase.index('wp8').nil? || !platforms.downcase.index('all').nil?
		indicators += ' wp8'
  	end
  	if (!platforms.downcase.index('win32').nil? || !platforms.downcase.index('all').nil?) && !msionly
		indicators += ' w32'
  	end
  	if msionly
		indicators += ' msi'
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
			element["name"] = getElementName(element)

			if !element.nil? && !element["generateAccessors"].nil? && element["generateAccessors"] == "true"
				generateAccessors = true
			end

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
			ruby = true
			javascript = true
		
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
						javascript = false
					end
				end
				if !element["APPLIES"][0]["jsOnly"].nil?
					if element["APPLIES"][0]["jsOnly"] == "true"
						ruby = false
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
			@usemoduleplatforms = false
			if !element["PLATFORM"].nil?
				@propplatforms = element["PLATFORM"][0]
				if !element["PLATFORM"][0]["usemodule"].nil?
					@usemoduleplatforms = true
				end
			else
				puts "      #{propname} no platform indicators"
				@usemoduleplatforms = true
			end
			@propplatforms = getplatformindicators(@propplatforms,msionly,ruby,javascript,@usemoduleplatforms,doc)
			@propplatformsfilter = getplatformindicatorsfilter(@propplatforms,msionly,ruby,javascript)
			@propsectionplatforms = "<div>"
			@propsectionplatforms += "<p>#{@propplatforms} #{propnote}</p></div>"
			
			
			if element["type"].nil?
				proptype= " : <span class='text-info'>STRING</span>"
				propusage=getpropusagetext(getApiName(doc,'JS',true),element["name"],'STRING',element["readOnly"],templatePropBag)
			else
				proptype= " : <span class='text-info'>" + element["type"] + "</span>"
				propusage=getpropusagetext(getApiName(doc,'JS',true),element["name"],element["type"],element["readOnly"],templatePropBag)
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
				if propdefault == "<p><strong>Default:</strong> </p>"
					propdefault=""
				end
				
			end
			
			@propdesc = getMDDesc(element["DESC"][0])
			if @propdesc.nil?
				RDiscount.new(@propdesc, :smart).to_html
			end
			@propvalues = ""
			@propvaluetype = "STRING" #STRING IS DEFAULT IF NO TYPE SPECIFIED FOR propvalue
			@seperator = ""
			if !element["VALUES"].nil?
				@propvalues = ""
				element["VALUES"].each() { |velement|

					velement["VALUE"].each() { |vaelement|
						@propvaldesc = "<dl  >"
						if !vaelement["DESC"].nil?
							if !vaelement["DESC"][0].empty?
								@propvaldesc = getMDDesc(vaelement["DESC"][0].to_s)
							else
								@propvaldesc = ""
							end 
						end	
						if !vaelement["PLATFORM"].nil?
							if !vaelement["PLATFORM"][0].empty?
								@propvaldesc += " Platforms: " + getMDDesc(vaelement["PLATFORM"][0].to_s)
							
							end 
						end
						@seperator = ', '
						if !vaelement["type"].nil?
							@propvaluetype = !vaelement["type"]
						end
						if !vaelement["constName"].nil?
							vaelement["value"] = 'Constant: ' + @@apiName + '.' + vaelement["constName"] + ' (For Ruby use "::" instead of ".")<br/> String: ' + vaelement["value"] + ' '

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
	templateDefault = false
	  	if !doc["MODULE"][0]["TEMPLATES"].nil? && !doc["MODULE"][0]["TEMPLATES"][0].nil? && !doc["MODULE"][0]["TEMPLATES"][0]["DEFAULT_INSTANCE"].nil?
	  		templateDefault = true
	  	end
	if element["access"].nil? && element["scopeOverride"].nil?
			#use global PROPERTIES field
			masterAccess = doc["MODULE"][0]["PROPERTIES"][0]["access"]
	else
			if !element["scopeOverride"].nil?
				masterAccess = element["scopeOverride"]
			else
				masterAccess = element["access"]
			end

	end
	if masterAccess.nil? || masterAccess == 'INSTANCE' || masterAccess == '' || generateAccessors
		accesstype = '<li><i class="icon-file"></i>Instance: This property can be accessed via an instance object of this class: <ul><li><code>myObject.' + element["name"] + '</code></li></ul></li>'
		if templateDefault
			accesstype += '<li><i class="icon-file"></i>Default Instance: This property can be accessed via the default instance object of this class. <ul>'
			if javascript 
				accesstype += '<li>JavaScript: <code>' + getApiName(doc,'JS',true) + '.' + element["name"] + '</code> </li>'
			end
			if ruby
				accesstype += '<li>Ruby: <code>' + getApiName(doc,'RUBY',true) + '.' + element["name"] + '</code></li>'
			end
			accesstype += '</ul></li>'

		end 
	else
		accesstype = '<li><i class="icon-book"></i>Class: This property can only be accessed via the API class object. <ul>'
		if javascript
			accesstype +='<li>JavaScript: <code>' + getApiName(doc,'JS',true) + '.' + element["name"] + '</code> </li>'
		end
		if ruby
			accesstype +='<li>Ruby: <code>' + getApiName(doc,'RUBY',true) + '.' + element["name"] + '</code></li>'
		end
		accesstype +='</ul></li>'

	end	
	@propsectionaccess = "<div><p><strong>Property Access:</strong></p><ul>#{accesstype}</ul></div>"


  	md += "<a name='p#{propname}'></a>"
 #  	md += "<div class='accordion property #{@propplatformsfilter}' id='p"+ propname + "'>"
 #    md += '<div class="accordion-group">'
 #    md += '<div class="accordion-heading">'
    
 #    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cProperty' + propname + '">'
 #    md += '<strong>' + propdisplayname  + '</strong>' + "#{proptype} #{propreadOnly} #{propver}"
	# md += '<i class="icon-chevron-down pull-left"></i></span>'
 #    md += "<div style='padding: 8px 15px;'>#{@propdesc}</div>"
 #    md += '</div>'
 #    md += '<div id="cProperty' + propname + '" class="accordion-body collapse in">'
 #    md +='  <div class="accordion-inner">'

 #  	md += getparams(element,true)
 #  	md += "#{propdefault}"
 #  	# puts element["PARAM"]
 #  	if !generateAccessors
 #  		md += '<p>This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.</p>'
	# else
 #  		# md += '<p><a href="#' + propname + 'Usage" class="btn" data-toggle="modal" title="View Usage">View Usage</a></p>'
	# end
 #  	md += @propvalues
 #  	 if generateAccessors
 #  		# md += "<p>" + propusage + "</p>"
 #  	 end
 #    md += "#{@propsectionplatforms} #{@propsectionaccess} </div>"
 #    md += '</div>'
 #    md += '</div>'
	# md += '</div>'

	propParasDef = getparams(element,true) + propdefault
  	if !generateAccessors
  		@propsectionaccess += '<p>This property cannot be accessed via setter or getter methods. It can be used in methods that allow a HASH or Array of properties to be passed in.</p>'
	end
  	md += "<div class=' method #{@propplatformsfilter}' id='p"+ propname + "'>"
    md += '<h3><strong  >' + propdisplayname + '</strong>' + "<span style='font-size:.7em;font-weight:normal;'>#{proptype} #{propreadOnly} #{propver}</span></h3>"
    md += '<ul class="nav nav-tabs" style="padding-left:8px">'
  	md += "<li class='active'>" + '<a href="#p' + propname + '1" data-toggle="tab">Description</a>' + "</li>"
  	if propParasDef != ''
    	md += "<li >"  + '<a href="#p' + propname + '2" data-toggle="tab">Params</a>' + "</li>"
    end
  	if @propvalues != ''
    
		md += "<li >"  + '<a href="#p' + propname + '5" data-toggle="tab">Values</a>' + "</li>"
  	end
  	md += "<li >"  + '<a href="#p' + propname + '6" data-toggle="tab">Access</a>' + "</li>"
  	# md += "<li >"  + '<a href="#p' + propname + '7" data-toggle="tab">Usage</a>' + "</li>"
  	md += '</ul>'
  	md += "<div class='tab-content' style='padding-left:8px' id='tc-"+ propname + "'>"
    md += '<div class="tab-pane fade active in" id="p' + propname + '1">' + "#{@propdesc}<p>#{@propsectionplatforms}</p></div>"
    md += '<div class="tab-pane fade" id="p' + propname + '2">' + propParasDef + "</div>"
  	md += '<div class="tab-pane fade" id="p' + propname + '5">' + @propvalues + "</div>"
  	md += '<div class="tab-pane fade" id="p' + propname + '6">' + @propsectionaccess + "</div>"
  	# md += '<div class="tab-pane fade" id="p' + propname + '7">' + propusage + "</div>"
  	md += '</div>'

  	md += '  </div>'




			end
	  	}
	end
  	return md
  end

def self.getparams(element,toplevel)
	# @seperator = ""
		
	# puts '***** IN GETPARAMS'
	# puts element

	methparamsdetails = ""
	methsectionparams = ""
		if !element["PARAMS"].nil?
			if !toplevel
				methsectionparams += "<ul>"
			end
			element["PARAMS"].each { |params|
				params["PARAM"].each { |param|
					param["name"] = getElementName(param) 
		
					methparamsdetailsdesc = ''
			
					# puts param
					if !param["DESC"].nil?
						methparamsdetailsdesc=getMDDesc(param["DESC"][0])
						if methparamsdetailsdesc.to_s == '{}'
							methparamsdetailsdesc= ''
						end
					end
					if !param["PLATFORM"].nil? && !toplevel
						pdesc=param["PLATFORM"][0]
						if pdesc.to_s == '{}'
							pdesc= ''
						else
							pdesc = ' Platforms:' + pdesc
						end
						methparamsdetailsdesc+=pdesc
						
					end
					
					if !param["propertyHash"].nil? && param["propertyHash"] == "true" && param["PARAMS"].nil?
						methparamsdetailsdesc += " Valid `properties` for this parameter are the properties avaliable to this API module. <a href='#Properties'>Check the property section</a>"
					end
					methparamsnil=""
					methparamsnildesc=""
					if !param["CAN_BE_NIL"].nil?
						param["CAN_BE_NIL"].each { |paramsnil|
							methparamsnil=" <span class='label label-info'>Optional</span>"
							if !paramsnil["DESC"].nil?
								methparamsnildesc =  getMDDesc(paramsnil["DESC"][0])
							end
							
						}
					end
					
					if !param["default"].nil?
						methparamsnil += "<span class='label '> Default: " + param["default"] + "</span>"
				
					end

					if param["type"].nil?
						param["type"] = "STRING"
					end
					if param["type"] == "SELF_INSTANCE"
						param["type"] = "SELF_INSTANCE: " + @@apiName
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
						values = "<dl  >"
								
						param["VALUES"].each() { |velement|
							velement["VALUE"].each() { |vaelement|
								if !vaelement["DESC"].nil?
									if !vaelement["DESC"][0].empty?
										valdesc = getMDDesc(vaelement["DESC"][0].to_s)
									else
										valdesc = ""
									end 
								end	
								if !vaelement["PLATFORM"].nil?
									if !vaelement["PLATFORM"][0].empty?
										valdesc += " Platforms: " + getMDDesc(vaelement["PLATFORM"][0].to_s)
									
									end 
								end

								@seperator = ', '
								if !vaelement["type"].nil?
									valuetype = vaelement["type"]
								end
								if !vaelement["constName"].nil?
									vaelement["value"] = 'Constant: ' + @@apiName + '.' + vaelement["constName"] + ' (For Ruby use "::" instead of ".")<br/> String:' + vaelement["value"] + ''
								end

								values += "<dt>#{vaelement["value"]}</dt><dd>#{valdesc}</dt>" 
								
							}
						

						}
						values += "</dl>"
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
					param["name"] = getElementName(param) 
		
					methparamsdetailsdesc = ''
			
					# puts param
					if !param["DESC"].nil?
						methparamsdetailsdesc=getMDDesc(param["DESC"][0])
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
								methparamsnildesc =  getMDDesc(paramsnil["DESC"][0])
							end
							
						}
					end
					if !param["default"].nil?
						methparamsnil += " <span class='label '> Default: " + param["default"] + "</span>"
				
					end
					
					if param["type"].nil?
						param["type"] = "STRING"
					end
					if param["type"] == "SELF_INSTANCE"
						param["type"] = "SELF_INSTANCE: " + @@apiName
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
								valdesc = "<dl  >"
								if !vaelement["DESC"].nil?
									if !vaelement["DESC"][0].empty?
										valdesc = getMDDesc(vaelement["DESC"][0].to_s)
									else
										valdesc = ""
									end 
								end	
								if !vaelement["PLATFORM"].nil?
									if !vaelement["PLATFORM"][0].empty?
										valdesc += " Platforms: " + getMDDesc(vaelement["PLATFORM"][0].to_s)
									
									end 
								end								
								@seperator = ', '
								if !vaelement["type"].nil?
									valuetype = vaelement["type"]
								end
								if !vaelement["constName"].nil?
									vaelement["value"] = 'Constant: ' + @@apiName + '.' + vaelement["constName"] + ' (For Ruby use "::" instead of ".")<br/> String: ' + vaelement["value"] + ' '
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
		element["name"] = getElementName(element) 
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
		
		if !element["DESC"].nil? && !element["DESC"][0].is_a?(Hash) 
			@methdesc = getMDDesc(element["DESC"][0])
			
		else
			@methdesc = ""
		end
		methreplaces = ""
		#Check to see if need to add to description about this method replacing a deprecated one
		if !doc["MODULE"][0]["METHODS"].nil? && !doc["MODULE"][0]["METHODS"][0]["ALIASES"].nil?  && !doc["MODULE"][0]["METHODS"][0]["ALIASES"][0].empty?
	    	doc["MODULE"][0]["METHODS"][0]["ALIASES"][0]["ALIAS"].each() { |a|
				#puts a
				if a["existing"] == element["name"]
					methreplaces += "<span class='label label-info'>" + a["new"] + "</span> "
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
		
				if !relement["DESC"].nil? && !relement["DESC"][0].is_a?(Hash)
					@methreturndesc=" : " + getMDDesc(relement["DESC"][0])
				end
				methreturnparams =  getparams(relement,false)
			}
		end
		@methplatforms = "All"
		@usemoduleplatforms = false
		if !element["PLATFORM"].nil?
			@methplatforms = element["PLATFORM"][0]
			if !element["PLATFORM"][0]["usemodule"].nil?
				@usemoduleplatforms = true
			end

		else
			puts "      #{methname} no platform indicators"
			@usemoduleplatforms = true
			
		end
		msionly = false
		ruby = true
		javascript = true
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
						javascript = false
					end
				end
				if !element["APPLIES"][0]["jsOnly"].nil?
					if element["APPLIES"][0]["jsOnly"] == "true"
						ruby = false
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


		@methplatforms = getplatformindicators(@methplatforms,msionly,ruby,javascript,@usemoduleplatforms,doc)
		@methplatformsfilter = getplatformindicatorsfilter(@methplatforms,msionly,ruby,javascript)
			
		@methsectionplatforms = "<div>"
		@methsectionplatforms += "<p>#{@methplatforms}#{methnote}</p></div>"
		
		@methsectionreturns = "<div>"
		@methsectionreturns += "<p><strong>Synchronous Return:</strong></p><ul>"
		if  (@methhascallback !="" && @methhascallback != "none")
			@methreturndesc += " : this method also supports async callbacks - check the Callback tab for callback return parameters."
		end
		@methsectionreturns += "<li>#{@methreturn}#{@methreturndesc}#{methreturnparams}</li></ul></div>"
			
		@methparams = ""
		@methparamsdetails = ""
		@methsectionparams = ""
		@theCallbackElement = nil
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
				callbacktype = "CallBackHandler"
				callbackreturntype = ""
				
				if !element["CALLBACK"].nil?
					@theCallbackElement = element["CALLBACK"]
				else
					@theCallbackElement = element["RETURN"]
				end

				 # puts @theCallbackElement
				
				if !@theCallbackElement.nil? && !@theCallbackElement[0]["type"].nil?
				
					callbackreturntype = @theCallbackElement[0]["type"]
				else
					callbackreturntype = "OBJECT"
				end
				if !@theCallbackElement.nil? && !@theCallbackElement[0]["PARAMS"].nil?
					# puts @theCallbackElement[0]["PARAMS"]
					firstcallbackreturnparam = @theCallbackElement[0]["PARAMS"][0]["PARAM"][0]["name"]
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
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc,'RUBY',true) + ".#{methname}(#{prevparams}" + " url_for :action => :mycallback)</code></pre>"
				@methcallbackparamdesc += "<p>JavaScript</p>\n<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc,'JS',true) + ".#{methname}(#{prevparams}" + "'/app/model/mycallback');</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Anonymous function:"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc,'RUBY',true) + ".#{methname}(#{prevparams}" + "lambda{ |e|\n puts e['#{firstcallbackreturnparam}'] }\n)</code></pre>"
				@methcallbackparamdesc += "<p>JavaScript</p>\n<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc,'JS',true) + ".#{methname}(#{prevparams}" + "function(e){\n//Your code here\n alert(e.#{firstcallbackreturnparam});\n};);</code></pre>"
				@methcallbackparamdesc += "</li>"
				@methcallbackparamdesc += "<li>Function"
				@methcallbackparamdesc += "<p>Ruby</p>\n<pre class='CodeRay'><code>:::ruby\n" + "" + getApiName(doc,'RUBY',true) + ".#{methname}(#{prevparams}" + " mycallback() )</code></pre>"
				@methcallbackparamdesc += "<p>JavaScript</p>\nok	<pre class='CodeRay'><code>:::javascript\n" + "" + getApiName(doc,'JS',true) + ".#{methname}(#{prevparams}" + " mycallback());</code></pre>"
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
		@methsample = "<b>" + getApiName(doc,'JS',true) + ".#{methname}(#{@methparams})</b><br/>"
		if @methparams != ""
			# @methvalues = "<br/><b>Possible Values:</b> " + @methvalues
		end
		if @methhascallback !="" && @methhascallback != "none"
			@callbackrubysample = "url_for :action => :take_callback"
			@callbackjssample = "function (e) { ... }"
			if @methparams != ""
				@methparams = @methparams + ", <span class='text-info'>#{callbacktype}</span> callback"
			else
				@methparams = @methparams + "<span class='text-info'>#{callbacktype}</span> callback"

			end
			@methsample = "Ruby Syntax:<br/><b>" + getApiName(doc,'RUBY',true) + ".#{methname}(#{@methparams}#{@callbackrubysample})</b><br/>"
			@methsample += "<br/>JavaScript Syntax:<br/><b>" + getApiName(doc,'JS',true) + ".#{methname}(#{@methparams}#{@callbackjssample})</b><br/><br/>"
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
			@methdesc = "<span class='label label-info'>Replaces:</span> #{methreplaces} " + @methdesc

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
			
			if !@theCallbackElement.nil? && !@theCallbackElement[0].nil?
				@methsectioncallbackparams = "<div>"
				@methsectioncallbackparams += "<p><strong>Async Callback Returning Parameters: <span class='text-info'>#{callbackreturntype}</span></strong></p><ul>"
			
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
				# puts @theCallbackElement
				@methsectioncallbackparams += getparams(@theCallbackElement[0],false)
				@methsectioncallbackparams += "</ul></div>"
			end  			
  			# md += @methcallbackdetails
  			# md += "</table></td></tr>"

  		end
  		# md += "</tr></table>\n\n" 
  		
  	if !element["BACKWARDS_COMPATIBILITY"].nil?
  		@methdesc += "\n\nNOTE: #{getMDDesc(element["BACKWARDS_COMPATIBILITY"][0]["DESC"][0])}\n\n"
	end		
	
	templateDefault = false
	  	if !doc["MODULE"][0]["TEMPLATES"].nil? && !doc["MODULE"][0]["TEMPLATES"][0].nil? && !doc["MODULE"][0]["TEMPLATES"][0]["DEFAULT_INSTANCE"].nil?
	  		templateDefault = true
	  	end
	if element["access"].nil? && element["scopeOverride"].nil?
			#use global PROPERTIES field
			masterAccess = doc["MODULE"][0]["METHODS"][0]["access"]
	else
			if !element["scopeOverride"].nil?
				masterAccess = element["scopeOverride"]
			else
				masterAccess = element["access"]
			end

	end
	constructor = false
  	constructorLabel = ''
  	if !element["constructor"].nil?
		if element["constructor"] == "true"
		    constructor = true
		    constructorLabel = '<span class="label label-inverse"> Constructor</span> '
		end
  	end
  	destructor = false
  	destructorLabel = ''
  	if !element["destructor"].nil?
		if element["destructor"] == "true"
		    destructor = true
		    destructorLabel = '<span class="label label-inverse"> Destructor</span> '
		end
  	end
	if masterAccess.nil? || masterAccess == 'INSTANCE' || masterAccess == ''
		accesstype = '<li><i class="icon-file"></i>Instance Method: This method can be accessed via an instance object of this class: <ul><li><code>myObject.' + element["name"] + "(#{@methparams})</code></li></ul></li>"
		if templateDefault
		accesstype += '<li><i class="icon-file"></i>Default Instance: This method can be accessed via the default instance object of this class. <ul>'
		if javascript 
			accesstype += '<li>JavaScript: <code>' + getApiName(doc,'JS',true) + '.' + element["name"] + "(#{@methparams})</code> </li>"
		end
		if ruby 
			accesstype += '<li>Ruby: <code>' + getApiName(doc,'RUBY',true) + '.' + element["name"] + "(#{@methparams})</code></li>"
		end
		accesstype += '</ul></li>'

		end 
	else
		accesstype = '<li><i class="icon-book"></i>Class Method: This method can only be accessed via the API class object. <ul>'
		if javascript 
			accesstype += '<li>JavaScript: <code>' + getApiName(doc,'JS',true) + '.' + element["name"] + "(#{@methparams})</code> </li>"
		end
		if ruby 
			accesstype += '<li>Ruby: <code>' + getApiName(doc,'RUBY',true) + '.' + element["name"] + "(#{@methparams})</code></li>"
		end
		accesstype += '</ul></li>'

	end	
	if constructor
		accesstype = '<li>Class Method: This method is a constructor and can only be accessed via the `new` construct. <ul>'
		if javascript 
			accesstype += '<li>JavaScript: <code>var myObj = new ' + getApiName(doc,'JS',true) + "(#{@methparams})</code> </li>"
		end
		if ruby 
			accesstype += '<li>Ruby: <code>@myObj = ' + getApiName(doc,'RUBY',true) + ".new(#{@methparams})</code></li>"
		end
		accesstype += '</ul></li>'
	end
	if destructor
		accesstype = '<li>Class Method: This method is a destructor and can only be accessed via the object that was created by the `new` constructor. <ul>'
		if javascript 
			accesstype += '<li>JavaScript: <code>myObj.' +  element["name"]  +  "(#{@methparams})</code> </li>"
		end
		if ruby 
			accesstype += '<li>Ruby: <code>@myObj.' +  element["name"]  +  "(#{@methparams})</code></li>"
		end
		accesstype += '</ul></li>'
	end
	@methsectionaccess = "<div><p><strong>Method Access:</strong></p><ul>#{accesstype}</ul></div>"

# Trying to change to Tabs - this was accordian view
 #  	md += "<div class='accordion method #{@methplatformsfilter}' id='m"+ element["name"] + "'>"
 #    md += '<div class="accordion-group">'
 #    md += '<div class="accordion-heading">'
    
 #    md += '<span class="accordion-toggle" data-toggle="collapse"  href="#cMethod' + element["name"] + '">'

 #    md += '<strong  >' + methname + '</strong>' + "(#{@methparams})"
	# md += '<i class="icon-chevron-down pull-left"></i></span>'
 #    md += "<div style='padding: 8px 15px;'>" + @methdesc + "</div>"
 #  	md += '</div>'
 #    md += '<div id="cMethod' + element["name"] + '" class="accordion-body collapse in">'
 #    md +='  <div class="accordion-inner">'

 #  	md += "" + @methsectionparams + ""
 #  	md += @methsectioncallbackparams
 #    md += @methsectionreturns
 #  	md += @methsectionplatforms
 #  	md += @methsectionaccess
 #  	md += '  </div>'
 #    md += '</div>'
 #    md += '</div>'
	# md += '</div>'
	md += "<a name ='m" + getshortcut(element) + "'/>"
  	md += "<div class=' method #{@methplatformsfilter}' id='m"+ getshortcut(element) + "'>"
  	
  	if constructor
	    md += "<h3>#{constructorLabel} <strong  > new " + @@apiName + '</strong>' + "<span style='font-size:.7em;font-weight:normal;'>(#{@methparams})</span></h3>"
  	else
	    md += "<h3><strong  >#{destructorLabel}" + methname + '</strong>' + "<span style='font-size:.7em;font-weight:normal;'>(#{@methparams})</span></h3>"
  	end

    md += '<ul class="nav nav-tabs" style="padding-left:8px">'
  	md += "<li class='active'>" + '<a href="#m' + getshortcut(element) + '1" data-toggle="tab">Description</a>' + "</li>"
  	if @methsectionparams != ''
    	md += "<li >"  + '<a href="#m' + getshortcut(element) + '2" data-toggle="tab">Parameters</a>' + "</li>"
    end
  	if @methsectioncallbackparams != ''

    	md += "<li >"  + '<a href="#m' + getshortcut(element) + '3" data-toggle="tab">Callback</a>' + "</li>"
	end
		md += "<li >"  + '<a href="#m' + getshortcut(element) + '4" data-toggle="tab">Return</a>' + "</li>"
    # md += "<li >"  + '<a href="#m' + element["name"] + '5" data-toggle="tab">Platforms</a>' + "</li>"
  	md += "<li >"  + '<a href="#m' + getshortcut(element) + '6" data-toggle="tab">Access</a>' + "</li>"
  	md += '</ul>'
  	md += "<div class='tab-content' style='padding-left:8px' id='tc-"+ getshortcut(element) + "'>"
    md += '<div class="tab-pane fade active in" id="m' + getshortcut(element) + '1">' + @methdesc + "<p>#{@methsectionplatforms}</p>" + "</div>"
    md += '<div class="tab-pane fade" id="m' + getshortcut(element) + '2">' + @methsectionparams + "</div>"
  	md += '<div class="tab-pane fade" id="m' + getshortcut(element) + '3">' + @methsectioncallbackparams + "</div>"
    md += '<div class="tab-pane fade" id="m' + getshortcut(element) + '4">' + @methsectionreturns + "</div>"
  	# md += '<div class="tab-pane fade" id="m' + element["name"] + '5">' + @methsectionplatforms + "</div>"
  	md += '<div class="tab-pane fade" id="m' + getshortcut(element) + '6">' + @methsectionaccess + "</div>"
  	md += '</div>'

  	md += '  </div>'
  





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
	  	# Add template methods,properties,constants
	  	if !doc["MODULE"][0]["TEMPLATES"].nil? && !doc["MODULE"][0]["TEMPLATES"][0].nil? && !doc["MODULE"][0]["TEMPLATES"][0]["INCLUDE"].nil?
	  		
	  		puts 'Has a template' 
	  		puts doc["MODULE"][0]["TEMPLATES"][0]["INCLUDE"]
	  		templateFileString = doc["MODULE"][0]["TEMPLATES"][0]["INCLUDE"][0]["path"]
	  		w = templateFileString.split("/")
	  		templateFile = w[w.length() - 1]
	  		templatedoc = XmlSimple.xml_in(File.join(AppConfig['api'],templateFile))
			templatedoc["MODULE"][0]["METHODS"][0]["METHOD"].each { |m|
				doc["MODULE"][0]["METHODS"][0]["METHOD"].push(m)
			}
			# puts(doc)
			if doc["MODULE"][0]["PROPERTIES"].nil?
				doc["MODULE"][0]["PROPERTIES"] = templatedoc["MODULE"][0]["PROPERTIES"]
			else
				templatedoc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].each { |m|
					doc["MODULE"][0]["PROPERTIES"][0]["PROPERTY"].push(m)
				}

			end
			puts (doc["MODULE"][0]["PROPERTIES"])
			templatedoc["MODULE"][0]["CONSTANTS"][0]["CONSTANT"].each { |m|
				doc["MODULE"][0]["CONSTANTS"][0]["CONSTANT"].push(m)
			}
	  	end
	  	if templateDefault
	  		#get xml from file and put it in main array so it is handled like other methods
	  		defaultdoc = XmlSimple.xml_in(File.join(AppConfig['api'],'default_instance.xml'))
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
	  		propbagdoc = XmlSimple.xml_in(File.join(AppConfig['api'],'property_bag.xml'))
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
	  	docconstants = getconstants(doc)
	  	examplelinks = getexamplelinks(doc)
	  	remarklinks = getremarklinks(doc)
	  	constantlinks = getconstantlinks(doc)
	  	proplinks = getpropertieslinks(doc)
	  	methlinks = getmethodslinks(doc)
	  	md += "#" + getApiName(doc,'',true) + "\n" 
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
	  	end
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
	  	if constantlinks["count"]>0
		  	md += '<div class="btn-group">'
		  	md += ''
		  	md += '<a href="#Constants" class="btn"><i class="icon-warning-sign"></i> Constants<sup>&nbsp;' + constantlinks["count"].to_s + '</sup></a>'
		    md += '<button href="#" class="btn dropdown-toggle" data-toggle="dropdown">'
		    md += '  <span class="caret"></span>&nbsp;'
		    md += '</button>'
		    md += '<ul class="dropdown-menu" style="max-height: 500px;overflow: auto;">'
		    md += constantlinks["md"]
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
		if !doc["MODULE"][0]["license"].nil? && doc["MODULE"][0]["license"]="Required"
			md += '<div class="btn-group">'
		    md += '<a href="#License" class="btn"><i class="icon-shopping-cart"></i> Licensing</a>'
		  	md += '</div>'
	  	end

			md += '<div class="btn-group pull-right">'
			md += '<button class="btn dropdown-toggle" id="apiFilterBtn" data-toggle="dropdown" href="#" title="Filter Properties and Methods"><i class="icon-filter "></i>Show</button>'
		  	md += '<select id="apiFilter" class="dropdown-menu apiFilter"><option value="all">All</option><option value="js">JavaScript</option><option value="ruby">Ruby</option>'
			md += '<option value="android">Android</option><option value="ios">iOS</option><option value="wm">Windows Mobile</option><option value="wp8">Windows Phone 8</option><option value="w32">Windows Desktop</option><option value="msi">MSI Only</option></select>'

		  	# md += '<button class="btn" id="expandAll" data-toggle="tooltip" title="Expand/Collapse all"><i class="icon-th-list "></i>&nbsp;</button>'
		  	md += '</div>'
	  	md += '<div  id="apibody" style="overflow:auto;padding-right: 5px;">'

	  	md += "\n" + getApiDesc(doc) + "\n" 
	  	if methlinks["count"]>0
		  	md += "\n<a name='Methods'></a>\n" + "<h2><i class='icon-cog'></i>Methods</h2>" + "\n\n" 
			
		  	md += '<div class="accordion" id="accordion">'
		    
		  	md += "" + getmethods(doc) + ""
		    md += "</div>"
		end
			if docproperties !=""
				 md += "\n<a name='Properties'></a>\n<h2><i class='icon-list'></i>Properties</h2>" + "\n\n" 
				if !doc["MODULE"][0]["PROPERTIES"].nil? && !doc["MODULE"][0]["PROPERTIES"][0]["generateAccessors"].nil? && doc["MODULE"][0]["PROPERTIES"][0]["generateAccessors"] == "false"
						md += "\n\nNOTE: The properties of this API Class cannot be accessed via setter or getter methods (unless otherwise noted). However they can be used in methods that allow a HASH or Array of properties to be passed in.\n\n"
				end
		  	 md += "" + docproperties + ""
	  	end 
  	    if docconstants !=""
		  	 md += "\n<a name='Constants'></a>\n<h2><i class='icon-tag'></i>Constants</h2>" + "\n\n" 
		  	 md += "" + docconstants + ""
	  	end 
		if docexamples !=""
		  	 md += "\n<a name='Examples'></a>\n<h2><i class='icon-edit'></i>Examples</h2>" + "\n\n" 
		  	 md += "" + docexamples + ""
	  	end 
	  	    if docremarks !=""
			  	 md += "\n<a name='Remarks'></a>\n<h2><i class='icon-warning-sign'></i>Remarks</h2>" + "\n\n" 
			  	 md += "" + docremarks + ""
		  	end 
		  	
		if !doc["MODULE"][0]["license"].nil? && doc["MODULE"][0]["license"]="Required"
			md += "\n<a name='License'></a>\n" + "<h2><i class='icon-shopping-cart'></i>Licensing</h2>" + "\n\n" 
			
		  	md += '<div class="accordion" id="accordion">'
		    
		  	md += "You can fully use all features of this API during evaluation, development or testing without obtaining a license. A message will be displayed on application startup and will also display a nag screen periodically. Before deploying an application to a production environment, you must obtain a license key. <a href='/guide/licensing'>Read more about licensing</a>."
		    md += "</div>"
	  	end
		    md += "</div>"

	  	# puts md
	  	file_extension = File.extname(topic)
	  	File.open("#{topic.gsub!(file_extension,'.md')}", 'w') {|f| f.write(md) }
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