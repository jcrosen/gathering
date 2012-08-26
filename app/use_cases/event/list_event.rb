# -*- coding: UTF-8 -*-

module UseCases
  
  class ListEvent < UseCase
    def exec
      begin
        events = db[Event].all
        Response.new(:events => events)
      rescue Exception => e
        raise e
      end
    end
  end
  
end