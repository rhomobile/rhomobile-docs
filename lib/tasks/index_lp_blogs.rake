desc 'index launchpad rhomobile blogs'
task :index_lp_blogs do
  url = "https://developer.motorolasolutions.com/api/core/v3/contents?filter=place(https%3A%2F%2Fdeveloper.motorolasolutions.com%2Fapi%2Fcore%2Fv3%2Fplaces%2F3573)&filter=type(post)"
  get_launchpad_blogs url
end