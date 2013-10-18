ruby "2.0.0"

source "https://rubygems.org"

gem "rails", "3.2.11"

gem "pg"

group :assets do
  gem "sass-rails", "~> 3.2.4"
  gem "coffee-rails", "~> 3.2.2"
  gem "uglifier", "~> 1.2.3"
end

gem "jquery-rails"
gem "stripe", "~> 1.6.2"
gem "gravtastic"
gem "figaro"
gem "heroku"
gem "honeybadger"
gem "bcrypt-ruby", :require => "bcrypt"
gem "carrierwave"
gem "fog"
gem "RedCloth"
gem "sendgrid"

group :development, :test do
  gem "capybara", "~> 1.1.0"
  gem "cucumber-rails", require: false
  gem "database_cleaner"
  gem "factory_girl_rails", "~> 1.7"
  gem "faker", "~> 1.0"
  gem "pry", "~> 0.9"
  gem "rspec-rails", "~> 2.8"
  gem "timecop", "~> 0.3"
  gem "guard-rspec"
  gem "simplecov", require: false
  gem "thin"
  gem "poltergeist"
end

group :production do
  gem 'unicorn'
  gem 'rack-canonical-host'
  gem 'rails_12factor'
end
