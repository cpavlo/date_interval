$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'date_interval/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'date_interval'
  s.version     = DateInterval::VERSION
  s.authors     = ['Pavlo Chervinskyi']
  s.email       = ['cpavlo@gmail.com']
  s.homepage    = 'https://github.com/cpavlo'
  s.summary     = 'Date Interval'
  s.description = 'Adds functionality to a rails application for filtering the collections by a date range'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.1'
  s.add_dependency 'haml-rails'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'sqlite3'
end
