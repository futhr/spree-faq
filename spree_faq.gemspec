lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spree_faq/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name          = 'spree-faq'
  s.version       = SpreeFaq.version
  s.summary       = %q{Adds an easy FAQ page for Spree Commerce}
  s.description   = %q{With this gem you get an faq page and the management tools to make it very easy to update your faq and reduce the demand on your sites customer service}
  s.required_ruby_version = '>= 1.9.3'

  s.authors      = ['Josh Nussbaum', 'Tobias Bohwalli']
  s.email        = 'hi@futhr.io'
  s.homepage     = 'https://github.com/futhr/spree-faq'
  s.license      = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_runtime_dependency 'spree_core', '~> 2.2.0'

  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'rspec-rails', '~> 2.14'
  s.add_development_dependency 'capybara', '~> 2.2.1'
  s.add_development_dependency 'selenium-webdriver', '>= 2.40.0'
  s.add_development_dependency 'poltergeist', '~> 1.5.0'
  s.add_development_dependency 'factory_girl', '~> 4.4'
  s.add_development_dependency 'shoulda-matchers', '~> 2.5'
  s.add_development_dependency 'sqlite3', '~> 1.3.8'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'database_cleaner', '~> 1.2.0'
  s.add_development_dependency 'i18n-spec', '~> 0.4.1'
  s.add_development_dependency 'coffee-rails', '~> 4.0.0'
  s.add_development_dependency 'sass-rails', '~> 4.0.0'
  s.add_development_dependency 'ffaker', '>= 1.24.0'
  s.add_development_dependency 'guard-rspec', '>= 4.2.0'
  s.add_development_dependency 'launchy', '>= 2.4.0'
  s.add_development_dependency 'pry-rails', '>= 0.3.0'
  s.add_development_dependency 'coveralls', '>= 0.7.0'
end
