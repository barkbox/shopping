$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopping/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopping"
  s.version     = Shopping::VERSION
  s.authors     = [""]
  s.email       = ["dan@barkbox.com"]
  s.homepage    = "https://barkbox.com"
  s.summary     = "Summary of Shopping."
  s.description = "Description of Shopping."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.2"
  s.add_dependency "jbuilder"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 3.5"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "rspec_api_documentation"
  s.add_development_dependency "apitome"
  s.add_development_dependency "database_cleaner"
end
