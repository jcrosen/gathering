# -*- coding: UTF-8 -*-

module UseCases
  
  class NewGathering < UseCase
    def exec
      Response.new(:gathering => Gathering.new)
    end
  end
  
end