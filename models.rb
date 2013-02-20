class Models
@docs = [
	{"source_id"=>40003, 
		"object"=>"125247353762549.02", 
		"docid"=>"rhodes/extensions", 
		"title"=>"Extending the Rhodes Framework", 
		"menutitle"=>"Build Application", 
		"type"=>"devguide", 
		"keywords"=>"ios, android, blackberry, windows mobile,", 
		"categories"=>"", 
		"contentfile"=>"rhodes/extensions", 
		"description"=>"There are three ways to extend Rhodes. You can add to the Ruby gems supported by Rhodes ('Rhodes extensions'). You can create new 'native extensions' in the underlying SDK for a given smartphone operating system. You can extend the types of views available in Rhodes ('native extensions').", 
		"keyclasses"=>[], 
		"seealso"=>[{"name"=>"Native Extensions Webinar","url"=>"https://developer.motorolasolutions.com/docs/DOC-1722"},
			{"name"=>"Native View Sample","url"=>"https://github.com/rhomobile/rhodes-system-api-samples/tree/master/extensions/rainbow/"}], 
		"sampleapp"=>"", "products"=>"", "visiblemenu"=>true, "visibledoc"=>true},
	{"source_id"=>40003, 
		"object"=>"", 
		"docid"=>"rhoelements/rfid", 
		"title"=>"", 
		"menutitle"=>"", 
		"type"=>"apiref", 
		"keywords"=>"", 
		"categories"=>"", 
		"contentfile"=>"rhoelements/rfid", 
		"description"=>"", 
		"keyclasses"=>[], 
		"seealso"=>[{"name"=>"RFID PlugIn","url"=>"https://support.symbol.com/support/search.do?cmd=displayKC&docType=kc&externalId=13856&sliceId=&dialogID=470318458&stateId=1%200%20470304681
"},
			{"name"=>"RhoMobile Suite SP1","url"=>"http://developer.motorolasolutions.com"}], 
		"sampleapp"=>"", "products"=>"", "visiblemenu"=>true, "visibledoc"=>true}
	]

def self.docs()	

return @docs
end	

def self.docmodel(filename)
	@docmodel = @docs.detect {|a| a["contentfile"] == filename }
	return @docmodel

end


end