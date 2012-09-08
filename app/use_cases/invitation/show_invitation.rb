# -*- coding: UTF-8 -*-

module UseCases
  
  class ShowInvitation < UseCase
    def exec
      begin
        invitation = db[Invitation].find(request.id)
        Response.new(:invitation => invitation)
      rescue RubyPersistenceAPI::ObjectNotFound => e
        raise e
      rescue Exception => e
        raise e
      end
    end
  end
  
end