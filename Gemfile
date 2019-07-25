source 'https://rubygems.org'

ruby '2.6.3'
gem 'rails', '>= 5'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '>= 0.14.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'paperclip', '~> 5.2.0'
gem 'fancybox2-rails'
gem 'jbuilder' # used for serialization of models into JSON
gem 'kaminari' # adds pagination to ActiveModels

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end


gem 'google_places'
# gem 'yelp'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'globalize', github: 'globalize/globalize'

gem "devise"
gem 'devise_invitable'
gem "cancan", ">= 1.6.8"

gem 'state_machine'

gem 'sidekiq'
gem 'haml'

gem 'bootstrap-sass'
gem 'grape'
# gem 'squeel'

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
  unless ENV['RM_INFO']
    # gem 'pry-full'
    gem 'byebug'
  end

  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'rspec-rails'
  # gem 'shoulda'
  gem 'shoulda-matchers'
end
