# -*- coding: UTF-8 -*-

ENV['APP_ENV'] = 'test'

# This loads the application without a front-end to simplify testing; also note that because it's a 'test' environment it uses active_memory for the backend
#require_relative('../app/application')
require_relative('../lib/all')

require 'minitest/autorun'
require 'minitest-colorize'
require 'mocha'
