source 'https://rubygems.org'

gem 'rails', '4.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '>= 0.14.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'google_places'
# gem 'yelp'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

gem 'jbuilder' # used for serialization of models into JSON
gem 'kaminari' # adds pagination to ActiveModels

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'globalize'

gem "devise"
gem 'devise_invitable'
gem "cancan", ">= 1.6.8"

gem 'state_machine'

gem 'sidekiq'
gem 'haml'

group :development, :test do
  #
  # unit testing
  #
  gem 'test-unit'
  #
  # perf testing
  #
  gem 'ruby-prof'
  #
  # test coverage
  #
  gem 'simplecov', :require => false
  #
  # populate test data
  #
  gem 'populator'
  gem 'faker'
  # To use debugger
  #gem 'linecache19', '0.5.13', :path => "~/.rvm/gems/ruby-1.9.3-p125/gems/linecache19-0.5.13/"
  #gem 'ruby-debug-base19', '0.11.26', :path => "~/.rvm/gems/ruby-1.9.3-p125/gems/ruby-debug-base19-0.11.26/"
  gem 'debugger'

  gem 'factory_girl_rails', :require => false
end
