desc 'Pull changes from Moto-Extensions, Rhodes, rhoconnect-client, and Docs repos, and update and process XML'
task :get_changes do
	repos = ["Motorola-Extensions", "rhodes", "rhoconnect-client", "rhomobile-docs"]
	log = ""
	# Iterate through the repos list and pull from each
	repos.each do |repo|
		output = `cd ../#{repo}; git pull`
		log << output
		puts output
	end

	# Change to docs repo and perform pull, update, and process on xml
	output = `cd ../rhomobile-docs; git pull; rake update_xml; rake process_xml;`
	log << output
	puts output
	system('git status')
end