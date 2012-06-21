ruby "1.9.3"

source "https://rubygems.org"

gem "rails", "3.2.2"

gem "pg"

group :assets do
  gem "sass-rails", "~> 3.2.4"
  gem "coffee-rails", "~> 3.2.2"
  gem "uglifier", "~> 1.2.3"
end

gem "jquery-rails", "~> 2.0.1"
gem "stripe", "~> 1.6.2"
gem "gravtastic"
gem "figaro"
gem "heroku"
gem "bcrypt-ruby", :require => "bcrypt"
gem "carrierwave"
gem "fog"
gem "RedCloth"
gem "sendgrid"

group :development, :test do
  gem "cucumber-rails", "~> 1.3", require: false
  gem "database_cleaner", "~> 0.7"
  gem "factory_girl_rails", "~> 1.7"
  gem "faker", "~> 1.0"
  gem "pry", "~> 0.9"
  gem "rspec-rails", "~> 2.8"
  gem "timecop", "~> 0.3"
  gem "guard-rspec"
  gem "simplecov", require: false
end

group :production do
  gem 'thin'
  gem 'rack-canonical-host'
end
