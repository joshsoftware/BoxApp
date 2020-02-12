# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0", ">= 6.0.2.1"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.2", ">= 1.2.2"
# Use Puma as the app server
gem "puma", "~> 3.11"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

gem "rb-readline"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors", "~> 1.1", ">= 1.1.1"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  # Utility to install, configure, and extend Git hooks
  gem "overcommit", "~> 0.52.1"
  # Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
  gem "rubocop", "~> 0.79.0", require: false
  # Strategies for cleaning databases. Can be used to ensure a clean slate for testing.
  gem "database_cleaner", "~> 1.7"
  # Provides integration between factory_bot and rails 4.2 or newer
  gem "factory_bot_rails", "~> 5.1", ">= 5.1.1"
  # Faker, a port of Data::Faker from Perl, is used to easily generate fake data.
  gem "faker", "~> 2.10", ">= 2.10.1"
  # BDD for Ruby
  gem "rspec", "~> 3.9"
  # A testing framework for Rails 3+.
  gem "rspec-rails", "~> 3.9"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  # The Bullet gem is designed to increase the application's performance by reducing the
  # number of queries it makes. Read more: https://github.com/flyerhzm/bullet
  gem "bullet"
  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security
  # vulnerabilities. Read more: https://github.com/presidentbeef/brakeman
  gem "brakeman"
end

group :test do
  # Code coverage for Ruby with a powerful configuration library and
  # automatic merging of coverage across test suites
  gem "simplecov", require: false
end

# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem "jwt"
# Autoload dotenv in Rails.
gem "dotenv-rails", "~> 2.7", ">= 2.7.5"
# Easy and powerful exception tracking for Ruby
gem "rollbar"
