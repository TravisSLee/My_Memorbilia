source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'sqlite3', '~> 1.4'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'devise'
gem 'omniauth'
gem 'omniauth-github'
gem 'pry'
gem 'dotenv-rails'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
