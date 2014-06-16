desc 'Pull changes from Moto-Extensions, Rhodes, and Docs repos, and update XML'
task :get_changes do
	log = `cd ../Motorola-Extensions; git pull; cd ../rhodes; git pull`
	log << `cd ../rhomobile-docs; git pull; rake update_xml;`
	puts log
	system('git status')
end