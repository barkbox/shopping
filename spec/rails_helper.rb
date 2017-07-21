ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/lib/shopping/version'
end
require File.expand_path("../dummy/config/environment.rb", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'factory_girl_rails'
require 'database_cleaner'
require 'pry'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  
  config.include Request::Helpers, type: :acceptance
  config.include Serializer::Helpers, type: :serializer
  config.include FactoryGirl::Syntax::Methods
end

RspecApiDocumentation.configure do |config|
  config.format = :markdown
  config.docs_dir = Rails.root.join("..", "..", "doc", "api")
end

ActiveRecord::Migration.maintain_test_schema!
