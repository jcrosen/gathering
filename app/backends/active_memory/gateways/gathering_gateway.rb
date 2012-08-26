# -*- coding: UTF-8 -*-

module Backends

  module ActiveMemory

    class GatheringGateway < RubyPersistenceAPI::ActiveMemory::Gateway

      entity_class Entities::Gathering

    end

  end

end
