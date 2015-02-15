lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_faq/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name          = 'spree-faq'
  s.version       = SpreeFaq.version
  s.summary       = 'Adds an easy FAQ page for Spree Commerce'
  s.description   = s.summary
  s.required_ruby_version = '>= 2.1.0'

  s.authors      = ['Josh Nussbaum', 'Tobias Bohwalli']
  s.email        = 'hi@futhr.io'
  s.homepage     = 'https://github.com/futhr/spree-faq'
  s.license      = 'BSD-3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_runtime_dependency 'spree_core', '~> 3.0.0.rc2'

  s.add_development_dependency 'rspec-rails', '~> 3.1.0'
  s.add_development_dependency 'capybara', '~> 2.4.1'
  s.add_development_dependency 'selenium-webdriver', '>= 2.41.0'
  s.add_development_dependency 'poltergeist', '~> 1.5.0'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'shoulda-matchers', '>= 2.6.2'
  s.add_development_dependency 'sqlite3', '~> 1.3.8'
  s.add_development_dependency 'simplecov', '~> 0.9.0'
  s.add_development_dependency 'database_cleaner', '~> 1.3.0'
  s.add_development_dependency 'coffee-rails', '~> 4.0.0'
  s.add_development_dependency 'sass-rails', '~> 4.0.0'
  s.add_development_dependency 'ffaker', '>= 1.24.0'
  s.add_development_dependency 'guard-rspec', '>= 4.2.0'
  s.add_development_dependency 'pry-rails', '>= 0.3.0'
  s.add_development_dependency 'coveralls', '>= 0.7.0'
  s.add_development_dependency 'rubocop', '>= 0.24.1'
end
