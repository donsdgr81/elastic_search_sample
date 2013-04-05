Rails.application.config.generators do |g|
  g.test_framework :rspec, view_specs: false, helper_specs: false, routing_specs: false
  g.fixture_replacement :fabrication
end
