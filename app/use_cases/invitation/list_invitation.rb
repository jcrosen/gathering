# -*- coding: UTF-8 -*-

module UseCases
  
  class ListInvitation < UseCase
    def exec
      begin
        if request.event_id
          invitations = db[Invitation].where(:event_id => request.event_id).all
        else
          invitations = db[Invitation].all
        end
        Response.new(:invitations => invitations)
      rescue Exception => e
        raise e
      end
    end
  end
  
end