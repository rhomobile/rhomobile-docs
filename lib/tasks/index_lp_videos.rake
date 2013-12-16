desc 'index launchpad videos'
task :index_lp_videos do
  url ="https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F5589)"
  get_lp_content url, 'video'
end