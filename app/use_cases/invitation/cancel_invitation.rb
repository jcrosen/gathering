# -*- coding: UTF-8 -*-

module UseCases
  
  class CancelInvitation < UseCase
    def exec
      begin
        invitations = []
        if request.id
          invitations << db[Invitation].find(request.id)
        elsif request.event_id
          invitations = db[Invitation].where(:event_id => request.event_id).all
        else
          errors = {:request_malformed => "The request was malformed; request: #{request}"}
        end
        
        unless errors
          invitations.each do |inv|
            inv.set_status_to_cancelled
            db[inv].save
          end
        end
        
        Response.new(:invitations => invitations, :errors => errors)

      rescue RubyPersistenceAPI::ObjectNotFound => e
        errors = {:exception => e.message}
        Response.new(:invitations => invitations, :errors => errors) 
      rescue Exception => e
        raise e
      end 
    end
  end
  
end