require_relative './controller_macros'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Warden::Test::Helpers

  config.extend ControllerMacros, type: :controller
  config.extend ControllerMacros, type: :view
  config.extend ControllerMacros, type: :feature
end