



## Html files
* These files will have been preformatted to be 'Launchpad friendly' so that they can just be imported into LP directly
* These files will be imported into LP using Jive REST v3 APIs https://developers.jivesoftware.com/api/v3/cloud/rest/index.html

## mapping.rb
* Will contain a Ruby hash that will be used to map files to Launchpad URLS

{
	"folder/file" =>
	{
		"id" => 
		{
			"uat" => "id of document on UAT",
			"prod" => "id of document on Production"
		},
		"url" => 
		{
			"uat" => "url of document on UAT",
			"prod" => "url of document on Production"
		}

	},
	.
	.
	.
}