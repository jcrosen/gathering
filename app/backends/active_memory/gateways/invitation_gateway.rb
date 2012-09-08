# -*- coding: UTF-8 -*-

module Backends

  module ActiveMemory

    class InvitationGateway < RubyPersistenceAPI::ActiveMemory::Gateway

      entity_class Entities::Invitation

    end

  end

end
