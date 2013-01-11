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
		"contentfile"=>"../rhodes/doc/extensions.txt", 
		"description"=>"There are three ways to extend Rhodes. You can add to the Ruby gems supported by Rhodes ('Rhodes extensions'). You can create new 'native extensions' in the underlying SDK for a given smartphone operating system. You can extend the types of views available in Rhodes ('native extensions').", 
		"keyclasses"=>[], 
		"seealso"=>[{"name"=>"Native Extensions Webinar","url"=>"https://developer.motorolasolutions.com/docs/DOC-1722"},
			{"name"=>"Native View Sample","url"=>"https://github.com/rhomobile/rhodes-system-api-samples/tree/master/extensions/rainbow/"}], 
		"sampleapp"=>"", "products"=>"", "visiblemenu"=>true, "visibledoc"=>true}]

def self.docs()	

return @docs
end	

def self.docmodel(filename)
	@docmodel = @docs.detect {|a| a["contentfile"] == filename }
	return @docmodel

end


end