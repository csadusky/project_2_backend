require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module Project2Backend
  class Application < Rails::Application
    config.time_zone = 'Eastern Time (US & Canada)'

    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
        allow do
            origins '*'
            resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options]
        end
    end
  end
end
