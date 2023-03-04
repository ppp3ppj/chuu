Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i[get post patch put delete]
    # Only allow GET requests on the API
    # resource '*', headers: :any, methods: [:get]
  end
end
