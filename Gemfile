source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'devise'
gem 'omniauth-facebook'
# gems for rest-client
gem 'rest-client', '~> 2.1'
gem 'mime-types', '~> 3.3', '>= 3.3.1'
gem 'netrc', '~> 0.11.0'
gem 'http-cookie', '~> 1.0', '>= 1.0.3'
#gem for payment-gateway paypal
gem 'paypal-sdk-rest'
gem 'paypal-checkout-sdk', '~> 1.0', '>= 1.0.3'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'dotenv-rails'
gem 'facebookbusiness', path: 'vendor/facebook-ruby-business-sdk-master/'
gem 'facebook_ads', path: 'vendor/facebook-ruby-ads-sdk-master/'
gem 'rolify'