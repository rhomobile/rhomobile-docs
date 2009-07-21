require 'cloudquery'

if ENV['CLOUDQUERY_USERNAME']

	SEARCH = (
		secret = Cloudquery::Client.get_secret(
			ENV["CLOUDQUERY_USERNAME"],
			ENV["CLOUDQUERY_PASSWORD"]
		)

		Cloudquery::Client.new(
			:account => ENV["CLOUDQUERY_USERNAME"],
			:secret => secret
		)
	)

	SEARCH.add_indexes("heroku.docs")

	SEARCH.add_schema(<<-XML)
	<schema name="heroku.docs.page" store="yes">
		<field
			name="name"
			type="string"
			usage="user"
		/>
		<field
			name="content"
			type="string"
			usage="user"
		/>
	</schema>
	XML

	SEARCH.update_documents(
		"heroku.docs",
		(
			Dir["docs/*.txt"].map do |section|
				{
					"#.#" => name = File.basename(section, ".txt"),
					"name" => name,
					"content" => File.read(section)
				}
			end
		),
		"heroku.docs.page"
	)
else
	warn "CLOUDQUERY_USERNAME environment not defined. search disabled"
end
