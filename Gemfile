source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '6.0.4'
gem 'image_processing',           '1.12.2'
gem 'mini_magick',                '4.9.5'
gem 'active_storage_validations', '0.8.2'
gem 'bcrypt', '3.1.13'
gem 'faker', '2.20.0'
gem 'will_paginate',           '3.3.1'
gem 'bootstrap-will_paginate', '1.0.0'
# Use Puma as the app serverbun
gem 'bootstrap-sass', '3.4.1'
gem 'puma', '4.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '5.1.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '4.0.7'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.9.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'dotenv-rails'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.10.3', require: false

group :development, :test do
	gem 'mysql2'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '4.0.1'
  gem 'listen', '3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.28.0'
  gem 'selenium-webdriver', '3.142.4'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '4.1.2'
	gem 'rails-controller-testing', '1.0.4'
  gem 'minitest', '5.11.3'
  gem 'minitest-reporters', '1.3.8'
  gem 'guard', '2.16.2'
  gem 'guard-minitest', '2.4.6'
end

group :production do
	gem 'mysql2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
