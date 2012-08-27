source "http://rubygems.org"

gem "rake", require: false

#------------------------------------------------------------#
#   Application
#------------------------------------------------------------#
gem "activemodel", "~> 3.2.8", require: "active_model"
gem "activesupport", "~> 3.2.8", require: "active_support/all"
gem "active_attr", "~> 0.6.0"

#------------------------------------------------------------#
#   Backends
#------------------------------------------------------------#
group :active_record_backend do
  gem 'sqlite3'
  gem 'activerecord', require: 'active_record'
end

group :active_memory_backend do
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Frontends
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

group :web_rails_frontend do
  gem 'unicorn', '4.3.1'
  gem 'rails', '3.2.8' #, require: false
  gem 'haml', '~> 3.1.7'
  gem 'jquery-rails', '~> 2.1.1'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer' # See https://github.com/sstephenson/execjs#readme for more supported runtimes

  gem 'bootstrap-sass'
end


#------------------------------------------------------------#
#   Testing Tools
#------------------------------------------------------------#
group :test do
  gem "cucumber", "~> 1.2.1", require: false
  gem 'minitest', "~> 3.3.0", require: false
  gem 'minitest-reporters', "~> 0.10.0", require: false
  gem 'mocha', "~> 0.12.3", require: false
  gem 'minitest-colorize', git: "https://github.com/nohupbrasil/minitest-colorize.git"
end
