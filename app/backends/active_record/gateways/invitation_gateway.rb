# -*- coding: UTF-8 -*-

module Backends

  module ActiveRecord

    class InvitationGateway < RubyPersistenceAPI::ActiveRecord::Gateway

      class Invitation < ::ActiveRecord::Base
      end

      entity_class Entities::Invitation
      ar_class Invitation

    end

  end

end
