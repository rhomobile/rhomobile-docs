desc 'Push latest docs to edgedocs'
task :publish_edge do
  `git add .`
  `git commit -m "jenkins auto-commit"`
  `git push origin master`
  `git push edge master`
end