$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ad_man/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ad_man"
  s.version     = AdMan::VERSION.dup
  s.authors     = ['David Strand', 'Tyler Hu']
  s.email       = ["connect@kudelabs.com"]
  s.homepage    = "http://github.com/kudelabs/ad_man"
  s.summary     = "An advertising manager mountable engine"
  s.description = "An advertising manager mountable engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  # s.add_dependency "jquery-rails"
  s.add_dependency "paperclip"
  s.add_development_dependency "sqlite3"
end
