$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'minitest/spec'
require 'minitest/autorun'
require 'pry'

require 'api_wrapper_example'

Dir['spec/support/**/*.rb'].each { |f| require_relative "../#{f}" }
