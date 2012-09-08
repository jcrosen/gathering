# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
include ApplicationWatch
  
describe CancelInvitation do
  
  it "cancels the invitation when we pass a specific invitation id" do
    invitation = Invitation.create_valid!
    response = CancelInvitation.new(:id => invitation.id).exec
    
    response.ok?.must_equal(true)
    invitation = db[Invitation].find(invitation.id)
    invitation.id.wont_be_nil
    invitation.cancelled?.must_equal(true)
  end
  
  it "cancels all invitations specific to a passed event id" do
    invite_1 = Invitation.create_valid!
    invite_2 = Invitation.create_valid!(:event_id => invite_1.event_id)
    response = CancelInvitation.new(:event_id => invite_1.event_id).exec
    response.ok?.must_equal(true)
    db[Invitation].where(:event_id => invite_1.event_id).all.each do |invitation|
      invitation.cancelled?.must_equal(true)
    end
  end

end

