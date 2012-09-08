# -*- coding: UTF-8 -*-

module UseCases
  
  class ListEvent < UseCase
    def exec
      begin
        if request.gathering_id
          events = db[Event].where(:gathering_id => request.gathering_id).all
        else
          events = db[Event].all
        end
        Response.new(:events => events)
      rescue Exception => e
        raise e
      end
    end
  end
  
end