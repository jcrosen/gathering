# -*- coding: UTF-8 -*-

module UseCases
  
  class UpdateEvent < UseCase
    def exec
      begin
        event = db[Event].find(request.id)
        #Countng on this call to raise an ObjectNotFound exception up the chain for an invalid reference
        gathering = db[Gathering].find(request.atts[:gathering_id])
        if db[event].update_attributes(request.atts)
          Response.new(:event => event)
        else
          Response.new(:event => event, :errors => event.errors)
        end
      rescue Exception => e
        raise e
      end 
    end
  end
  
end