# -*- encoding : utf-8 -*-

module UseCases
  class CreateInvitation < UseCase
    def exec
      begin
        # Counting on this call to raise an ObjectNotFound exception which will raise up to the next level of execution if we try to create an invitation with a non-existed event
        db[Event].find(request.atts[:event_id])
        
        request.atts[:status] = "new" if request.atts[:status].nil?
        
        invitation = Invitation.new(request.atts)
        if invitation.valid?
          db[invitation].save
          Response.new(:invitation => invitation)
        else
          Response.new(:invitation => invitation, :errors => invitation.errors)
        end
      rescue RubyPersistenceAPI::ObjectNotFound => e
        Response.new(:invitation => nil, :errors => {:exception => e.message}) 
      rescue Exception => e
        raise e
      end
    end
  end
end