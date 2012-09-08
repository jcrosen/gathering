# -*- encoding : utf-8 -*-

module UseCases
  
  class NewInvitation < UseCase
    def exec
      Response.new(:invitation => Invitation.new)
    end
  end
  
end
