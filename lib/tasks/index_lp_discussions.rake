desc 'index launchpad rhomobile & rhoconnect discussions'
task :index_lp_discussions do
  #rhomobile discussions
  url = "https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F3577)"
  get_lp_content url, 'discussion'
  url = "https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F3770)"
  get_lp_content url, 'discussion'
end
