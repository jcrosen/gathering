# -*- coding: UTF-8 -*-

module UseCases
  
  class EditGathering < UseCase
    def exec
      begin
        gathering = db[Gathering].find(request.id)
        Response.new(:gathering => gathering)
      rescue RubyPersistenceAPI::ObjectNotFound => e
        raise e
      rescue Exception => e
        raise e
      end
    end
  end
  
end