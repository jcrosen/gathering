# -*- coding: UTF-8 -*-

module UseCases
  
  class DestroyEvent < UseCase
    def exec
      begin
        event = db[Event].find(request.id)
        if db[Invitation].where(:event_id => event.id).first
          Response.new(:event => nil, :errors => {:reference_error => "Unable to destroy event with id #{event.id}; Invitations that reference this event still exist"})
        else
          Response.new(:event => db[event].destroy)
        end
      rescue Exception => e
        raise e
      end
    end
  end
  
end