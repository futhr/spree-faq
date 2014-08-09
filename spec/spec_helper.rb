require 'simplecov'
require 'coveralls'
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter 'spec'
  add_filter 'lib/spree_faq/engine'
  add_group  'Controllers', 'app/controllers'
  add_group  'Overrides', 'app/overrides'
  add_group  'Models', 'app/models'
  add_group  'Libraries', 'lib'
end

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)

require 'rspec/rails'
require 'shoulda-matchers'
require 'ffaker'

RSpec.configure do |config|
  config.mock_with :rspec do |mock|
    mock.syntax = [:should, :expect]
  end

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
end

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }
