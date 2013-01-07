class Models
@docs = [
	{"source_id"=>40003, 
		"object"=>"125247353762549.02", 
		"docid"=>"rhodes/build", 
		"title"=>"Build Rhodes Application", 
		"menutitle"=>"Build Application", 
		"type"=>"devguide", 
		"keywords"=>"ios, android, blackberry, windows mobile,", 
		"categories"=>"", 
		"contentfile"=>"../rhodes/doc/build.txt", 
		"description"=>"This page describes how to build Rhodes Application on all of our supported platforms: iPhone, RIM Blackberry, Windows Mobile and Android.", 
		"keyclasses"=>[{"name"=>"External Blog 1","url"=>"http://developer.motorolasolutions.com"},
			       {"name"=>"Install Rhodes","url"=>"/rhodes/install"}], 
		"seealso"=>[{"name"=>"External Blog 1","url"=>"http://developer.motorolasolutions.com"},
			       {"name"=>"Install Rhodes","url"=>"/rhodes/install"}], 
		"sampleapp"=>"", "products"=>"", "visiblemenu"=>true, "visibledoc"=>true}]

def self.docs()	

return @docs
end	

def self.docmodel(filename)
	@docmodel = @docs.detect {|a| a["contentfile"] == filename }
	return @docmodel

end


end