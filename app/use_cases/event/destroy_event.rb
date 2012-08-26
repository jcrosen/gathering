# -*- coding: UTF-8 -*-

module UseCases
  
  class DestroyEvent < UseCase
    def exec
      begin
        event = db[Event].find(request.id)
        Response.new(:event => db[event].destroy)
      rescue Exception => e
        raise e
      end
    end
  end
  
end