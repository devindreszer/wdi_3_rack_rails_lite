require 'pry'

# Gives you a full path to the root directory of the app
$RAILS_ROOT = "#{__FILE__.split('/')[0..-3].join('/')}"

 # Get active support help
require 'active_support/all'

 # Require all of the rails files in these directories
 # Walks through all files within a directory
Dir["#{$RAILS_ROOT}/app/controllers/**/*.rb"].each { |f| require(f) }
Dir["#{$RAILS_ROOT}/app/models/**/*.rb"].each { |f| require(f) }
Dir["#{$RAILS_ROOT}/lib/**/*.rb"].each { |f| require(f) }

require_relative "./application.rb"

require 'erubis'
