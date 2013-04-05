if defined?(Konacha)
  require 'rspec/rails'
  require 'ci/reporter/rspec'

  Konacha.configure do |config|
    config.driver = :poltergeist
  end
end
