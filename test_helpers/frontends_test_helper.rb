# -*- coding: UTF-8 -*-

ENV['APP_ENV'] = 'test'

require_relative('../app/frontends/web/config/environment')

require 'minitest/autorun'
#require 'minitest-colorize'

require 'application_watch/test_case'
require 'application_watch/integration_test'

require 'factories/all'
