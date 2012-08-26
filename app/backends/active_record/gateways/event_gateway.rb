# -*- coding: UTF-8 -*-

module Backends

  module ActiveRecord

    class EventGateway < RubyPersistenceAPI::ActiveRecord::Gateway

      class Event < ::ActiveRecord::Base
      end

      entity_class Entities::Event
      ar_class Event

    end

  end

end
