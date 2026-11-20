ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  fixtures :all
end

# Configurar Firefox como navegador para las pruebas del sistema
Capybara.register_driver :headless_firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new(args: [ "-headless" ])
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

# Guardar capturas de pantalla aquí si falla un test
Capybara.save_path = Rails.root.join("tmp/capybara")

# Usar Firefox como navegador por defecto para pruebas del sistema
Capybara.javascript_driver = :headless_firefox
