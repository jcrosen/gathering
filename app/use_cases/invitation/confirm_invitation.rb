# -*- coding: UTF-8 -*-

module UseCases
  
  class ConfirmInvitation < UseCase
    def exec
      begin
        invitation = db[Invitation].find(request.id)
        
        if invitation.token == request.token
          if Invitation.status_list.include?(request.status)
            invitation.send("set_status_to_#{request.status}")
            db[invitation].save
            Response.new(:invitation => invitation)
          else
            Response.new(:invitation => invitation, :errors => {:invalid_value => "Invalid value passed for invitation status: #{request.status}"})
          end
        else
          Response.new(:invitation => invitation, :errors => {:invalid_token => "Invalid token supplied to confirm an invitation: #{request.token}"})
        end
      rescue RubyPersistenceAPI::ObjectNotFound => e
        errors = {:exception => e.message, :object_not_found => "The invitation id requested was not found: #{request.id}"}
        errors.merge(invitation.errors) if invitation
        Response.new(:invitation => invitation, :errors => errors) 
      rescue Exception => e
        raise e
      end 
    end
  end
  
end