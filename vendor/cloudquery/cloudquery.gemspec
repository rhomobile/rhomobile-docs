# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cloudquery}
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cameron Walters", "nb.io"]
  s.date = %q{2009-05-04}
  s.description = %q{Client for Xoopit's cloudquery API}
  s.email = %q{us@nb.io}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION.yml",
    "lib/cloudquery.rb",
    "spec/cloudquery_spec.rb",
    "spec/example_schema.xml",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/nbio/cloudquery}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Client for Xoopit's cloudquery API}
  s.test_files = [
    "spec/cloudquery_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rack>, [">= 1.0"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.4"])
      s.add_runtime_dependency(%q<taf2-curb>, [">= 0.2.8.0"])
    else
      s.add_dependency(%q<rack>, [">= 1.0"])
      s.add_dependency(%q<json>, [">= 1.1.4"])
      s.add_dependency(%q<taf2-curb>, [">= 0.2.8.0"])
    end
  else
    s.add_dependency(%q<rack>, [">= 1.0"])
    s.add_dependency(%q<json>, [">= 1.1.4"])
    s.add_dependency(%q<taf2-curb>, [">= 0.2.8.0"])
  end
end
