# -*- coding: UTF-8 -*-

module RubyPersistenceAPI

  module QueryExecutors

    def first
      gateway.first(self)
    end

    def all
      gateway.all(self)
    end

    def find(id)
      begin
        gateway.find(id, self)
      rescue Exception => e
        raise e
      end
    end

    def create(attributes = { })
      gateway.create(attributes)
    end

    def create!(attributes = { })
      gateway.create!(attributes)
    end

  end

end
