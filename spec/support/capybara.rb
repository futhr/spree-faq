require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

module CapybaraHelpers; end

RSpec.configure do |config|
  config.include CapybaraHelpers, type: :feature

  Capybara.javascript_driver = :poltergeist

  config.before(:each, :js) do
    if Capybara.javascript_driver == :selenium
      page.driver.browser.manage.window.maximize
    end
  end
end