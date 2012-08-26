# -*- coding: UTF-8 -*-

module Backends

  module ActiveRecord

    # Creating new gateway class which the RPAPI will deduce from the Class name ("Gathering" class uses "GatheringGateway")
    class GatheringGateway < RubyPersistenceAPI::ActiveRecord::Gateway

      # Subclassing AcitveRecord; if we want to create AR hooks we could in theory do that here, though not sure that's most prudent
      class Gathering < ::ActiveRecord::Base
      end

      # Configuring the class for the gateway
      entity_class Entities::Gathering
      # Configuring the class for Active Record
      ar_class Gathering

    end

  end

end
