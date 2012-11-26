source 'https://rubygems.org'

gem 'rails'
gem 'client_side_validations'
gem 'devise'

group :development#, :test do
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
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'cucumber-rails'#, :require => false
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
end