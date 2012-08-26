# -*- coding: UTF-8 -*-

module UseCases
  
  class ShowEvent < UseCase
    def exec
      begin
        event = db[Event].find(request.id)
        Response.new(:event => event)
      rescue RubyPersistenceAPI::ObjectNotFound => e
        raise e
      rescue Exception => e
        raise e
      end
    end
  end
  
end