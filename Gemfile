source 'https://rubygems.org'

gem 'rails' --version 3.2.9
#gem 'bootstrap-sass' --version 2.2.1.1
gem 'bcrypt-ruby' --version 3.0.1
gem 'faker' --version 1.1.2
gem 'will_paginate' --version 3.0.3
#gem 'bootstrap-will_paginate' --version 
gem 'jquery-rails' --version 2.1.3
gem 'client_side_validations' --version 3.2.1
gem 'devise' --version 2.1.2
gem 'cancan' --version 1.6.8
gem 'paperclip' --version 3.3.1
gem 'aws-sdk' --version 1.7.1

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
  gem 'sass-rails' --version 3.2.5
  #gem 'coffee-rails'
  #gem 'uglifier'
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