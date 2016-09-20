desc 'index stackoverflow discussions'
task :index_stackoverflow do
  url = 'http://api.stackexchange.com/2.1/search?order=desc&sort=activity&tagged=rhomobile&site=stackoverflow&filter=withbody'
  get_stackoverflowitems url,1,100
end