# -*- encoding : utf-8 -*-

module UseCases
  class NewEvent < UseCase
    def exec
      Response.new(:event => Event.new)
    end
  end
end
