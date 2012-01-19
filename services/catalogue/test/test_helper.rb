ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rubygems'
require 'test/unit'
#require 'dust'
require 'active_support'
#require 'initializer'
#require 'arbs'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
#  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def random_string
  (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
end

def random_integer
  rand(100)
end
