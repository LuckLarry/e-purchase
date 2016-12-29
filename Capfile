# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# https://github.com/dei79/capistrano-rails-collection
#cap production or staging rails:rake:log:clear
#cap production or staging rails:rake:tmp:clear
#cap production or staging rails:rake:db:drop
#cap production or staging rails:rake:db:reset
#cap production or staging rails:rake:db:setup
#cap production or staging rails:rake:db:seed
#cap production or staging rails:rake:db:migrate
#cap production or staging rails:rake:db:rollback
require 'capistrano/rails/collection'

# Include tasks from other gems included in your Gemfile
#
# For documentation on these, see for example:
#
#   https://github.com/capistrano/rvm
#   https://github.com/capistrano/rbenv
#   https://github.com/capistrano/chruby
#   https://github.com/capistrano/bundler
#   https://github.com/capistrano/rails
#   https://github.com/capistrano/passenger
#
# require 'capistrano/rvm'
require 'capistrano/rbenv'
# require 'capistrano/chruby'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
