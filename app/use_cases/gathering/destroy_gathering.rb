# -*- coding: UTF-8 -*-

module UseCases
  
  class DestroyGathering < UseCase
    def exec
      begin
        gathering = db[Gathering].find(request.id)
        Response.new(:gathering => db[gathering].destroy)
      rescue Exception => e
        raise e
      end
    end
  end
  
end