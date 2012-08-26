# -*- coding: UTF-8 -*-

module UseCases
  
  class ListGathering < UseCase
    def exec
      begin
        gatherings = db[Gathering].all
        Response.new(:gatherings => gatherings)
      rescue Exception => e
        raise e
      end
    end
  end
  
end