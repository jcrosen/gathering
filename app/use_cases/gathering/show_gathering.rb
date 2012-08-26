# -*- coding: UTF-8 -*-

module UseCases
  
  class ShowGathering < UseCase
    def exec
      begin
        gathering = db[Gathering].find(request.id)
        Response.new(:gathering => gathering)
      rescue Exception => e
        raise e
      end
    end
  end
  
end