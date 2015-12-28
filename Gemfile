source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.2.5'

# Env variables (must be at top)
gem 'dotenv-rails', group: [:development, :test]

# Database
gem 'pg', '~> 0.15'
gem 'attribute_normalizer'

# Factories
gem 'factory_girl_rails'

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'

group :production do
  gem 'puma'
end

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'


# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'thin'
  gem 'rspec-rails', '~> 3.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'guard-rspec', require: false
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'poltergeist'
  gem 'selenium-webdriver'
  gem 'launchy'
  gem 'database_cleaner'
end

# Gems to install outside the Gemfile
# foreman
