# -*- encoding : utf-8 -*-

module UseCases
  class CreateEvent < UseCase
    def exec
      begin
        # Counting on this call to raise an ObjectNotFound exception which will raise up to the next level of execution
        db[Gathering].find(request.atts[:gathering_id])
        event = Event.new(request.atts)
        if event.valid?
          db[event].save
          Response.new(:event => event)
        else
          Response.new(:event => event, :errors => event.errors)
        end
      rescue RubyPersistenceAPI::ObjectNotFound => e
        Response.new(:event => nil, :errors => {:exception => e.message}) 
      rescue Exception => e
        raise e
      end
    end
  end
end