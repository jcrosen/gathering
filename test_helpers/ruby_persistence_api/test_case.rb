# -*- coding: UTF-8 -*-

require_relative '../application_watch/test_case'

module RubyPersistenceAPI

  class TestCase < ApplicationWatch::TestCase

    def db
      RubyPersistenceAPI::Application.instance.config.backend
    end

    def create_four_animals
      2.times do |i|
        db[Entities::Cat].create!
        db[Entities::Dog].create!(name: "Dog #{i}")
      end
    end

  end

end
