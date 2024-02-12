source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'

gem 'active_interaction'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'faraday'
gem 'good_job'
gem 'image_processing'
gem 'importmap-rails'
gem 'jbuilder'
gem 'nanoid'
gem 'pg'
gem 'portrayal'
gem 'puma', '~> 6.0'
gem 'pundit'

gem 'rails', '~> 7.1.2'
gem 'redis', '~> 5.0'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'view_component'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'brakeman'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'i18n-tasks'
  gem 'foreman'

  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails'
  gem 'rubocop-rspec', require: false

  gem 'rack-mini-profiler'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'coveralls_reborn', require: false

  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'simplecov-lcov', require: false
  gem 'webmock'
end
