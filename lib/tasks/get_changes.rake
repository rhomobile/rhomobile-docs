desc 'Pull changes from Moto-Extensions, Rhodes, and Docs repos, and update and process XML'
task :get_changes do
	log = `cd ../Motorola-Extensions; git pull; cd ../rhodes; git pull`
	log << `cd ../rhomobile-docs; git pull; rake process_xml; rake update_xml;`
	puts log
	system('git status')
end