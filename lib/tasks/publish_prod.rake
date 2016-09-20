desc 'Publish docs to production'
task :publish_prod do
  `git pull`
  `git push production master`
  `heroku run rake index --app rhodocs-cedar`
end