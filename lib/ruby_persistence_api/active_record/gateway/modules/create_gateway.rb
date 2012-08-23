# -*- coding: UTF-8 -*-

module RubyPersistenceAPI

  module ActiveRecord

    module CreateGateway

      def create(attributes = { })
        self.entity = entity_class.new(attributes)
        save
        entity
      end

      def create!(attributes = { })
        self.entity = entity_class.new(attributes)
        save!
        entity
      end

    end

  end

end
