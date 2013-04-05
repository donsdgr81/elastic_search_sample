ENV["RAILS_ENV"] ||= 'test'

if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-rcov-text'
  SimpleCov.formatter = SimpleCov::Formatter::RcovTextFormatter
  SimpleCov.start
end

require 'ostruct'
require 'pathname'
require 'active_support'
require 'active_support/dependencies'

RAILS_ROOT = Pathname.new(File.expand_path("../..", __FILE__))
# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["/Users/imac/Projects/application_templates/support/**/*.rb"].each { |f| require f }
