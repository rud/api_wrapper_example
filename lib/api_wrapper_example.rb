require 'faraday'
require 'faraday_middleware'
require 'artifice' # to implement .mock! method
require 'sinatra'  # to implement sample in-memory API server

require 'api_wrapper_example/version'
require 'api_wrapper_example/client'
require 'api_wrapper_example/mock/api_server'
