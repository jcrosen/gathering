# -*- coding: UTF-8 -*-

module UseCases
  
  class UpdateGathering < UseCase
    def exec
      begin
        gathering = db[Gathering].find(request.id)
        if db[gathering].update_attributes(request.atts)
          Response.new(:gathering => gathering)
        else
          Response.new(:gathering => gathering, :errors => gathering.errors)
        end
      rescue Exception => e
        raise e
      end 
    end
  end
  
end