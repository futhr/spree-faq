require 'rspec'
require 'i18n-spec'

RSpec.configure do |config|

  config.after(type: :feature) do
    missing = page.body.scan(/translation missing: #{I18n.locale}\.(.*?)[\s<\"&]/)
    if missing.any?
      puts "\e[1m\e[35mFound missing translations: #{missing.inspect}\e[0m"
      puts "\e[1m\e[35mIn spec: #{example.location}\e[0m"
    end
  end
end
