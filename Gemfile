source 'https://rubygems.org'

gem 'rails' --ignore-dependencies
gem 'bootstrap-sass' --ignore-dependencies
gem 'bcrypt-ruby' --ignore-dependencies
gem 'faker' --ignore-dependencies
gem 'will_paginate' --ignore-dependencies
gem 'bootstrap-will_paginate' --ignore-dependencies
gem 'jquery-rails' --ignore-dependencies
gem 'client_side_validations' --ignore-dependencies
gem 'devise' --ignore-dependencies
gem 'cancan' --ignore-dependencies
gem 'paperclip' --ignore-dependencies
gem 'aws-sdk' --ignore-dependencies

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'spork'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
end