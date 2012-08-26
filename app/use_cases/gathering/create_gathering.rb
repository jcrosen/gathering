# -*- coding: UTF-8 -*-

module UseCases
  
  class CreateGathering < UseCase
    def exec
      gathering = Gathering.new(request.atts)
      
      if gathering.valid?
        db[gathering].save
        Response.new(:gathering => gathering)
      else
        Response.new(:gathering => gathering, :errors => gathering.errors)
      end
    end
  end
  
end