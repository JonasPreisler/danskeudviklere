require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DanskeUdviklere
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # list of game devs
    # https://docs.google.com/spreadsheets/u/0/d/15u7FjJKuioKc5yX5Ns33-iSnToFXwC0NC6CB_gZxzkM/pub?output=html

    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

    config.i18n.default_locale = :'da'
    config.exceptions_app = self.routes

    config.time_zone =  if Rails.env.development?
                          'Beijing'
                        else
                          'Copenhagen'
                        end


    # config.hosts << 'd0a4-110-235-176-99.ngrok.io'
  end
end
