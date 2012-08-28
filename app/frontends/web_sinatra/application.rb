# Load up the core application
require File.expand_path('../../../application', __FILE__)

Bundler.require(:web_sinatra_frontend)
Bundler.require(:assets_sinatra)

# Load up sinatra
require 'sinatra'

# Load the controllers
require_relative 'controllers/index'
