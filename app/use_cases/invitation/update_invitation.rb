# -*- coding: UTF-8 -*-

module UseCases
  
  class UpdateInvitation < UseCase
    def exec
      begin
        invitation = db[Invitation].find(request.id)
        #Countng on this call to raise an ObjectNotFound exception up the chain for an invalid reference
        event = db[Event].find(request.atts[:event_id])
        if db[invitation].update_attributes(request.atts)
          Response.new(:invitation => invitation)
        else
          Response.new(:invitation => invitation, :errors => invitation.errors)
        end
      rescue RubyPersistenceAPI::ObjectNotFound => e
        errors = {:exception => e.message}
        errors.merge(invitation.errors) if event
        Response.new(:invitation => invitation, :errors => errors) 
      rescue Exception => e
        raise e
      end 
    end
  end
  
end