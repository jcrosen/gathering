# -*- coding: UTF-8 -*-

module Backends

  module ActiveMemory

    class EventGateway < RubyPersistenceAPI::ActiveMemory::Gateway

      entity_class Entities::Event

    end

  end

end
