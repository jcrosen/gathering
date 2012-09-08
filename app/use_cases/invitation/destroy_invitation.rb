# -*- coding: UTF-8 -*-

module UseCases
  
  class DestroyInvitation < UseCase
    def exec
      begin
        invitation = db[Invitation].find(request.id)
        Response.new(:invitation => db[invitation].destroy)
      rescue Exception => e
        raise e
      end
    end
  end
  
end