# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Gamelog::Application.initialize!

require 'randomly_sharded_mongomapper_document'
