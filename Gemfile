source 'https://rubygems.org'
gem 'rails', '4.0.0.beta1'
gem 'pg'
group :assets do
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.0.1'
gem "postmark-rails"
gem "capistrano"
gem 'tire'
gem 'will_paginate'
group :development do
  gem "pry"
  gem "thin"
  gem "quiet_assets"
  gem "fdoc"
end
group :development, :test do
  gem "rspec-rails", "~> 2.13.0"
  gem "fabrication"
  gem "brakeman"
  gem "metric_fu"
  gem "konacha"
end
group :test do
  gem "cucumber-rails", require: false
  gem "capybara"
  gem "database_cleaner"
  gem "faker"
  gem "timecop"
  gem "poltergeist", require: "capybara/poltergeist"
  gem "launchy"
  gem "ci_reporter"
  gem "simplecov", require: false
  gem "simplecov-rcov-text", require: false
end
