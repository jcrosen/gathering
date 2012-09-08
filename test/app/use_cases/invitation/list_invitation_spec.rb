# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe ListInvitation do
  
  it "returns all Invitations that have been persisted" do
    invitation1 = Invitation.create_valid!
    invitation2 = Invitation.create_valid!
    invitation3 = Invitation.new
    response = ListInvitation.new.exec
    response.ok?.must_equal(true)
    response.invitations.size.must_equal(2)
    response.invitations.must_include(invitation1)
    response.invitations.must_include(invitation2)
    response.invitations.wont_include(invitation3)
  end
  
  it "returns all Invitations persisted with the specified event id" do
    invitation1 = Invitation.create_valid!
    invitation2 = Invitation.create_valid!(:event_id => invitation1.event_id)
    invitation3 = Invitation.create_valid!
    response = ListInvitation.new(:event_id => invitation1.event_id).exec
    response.ok?.must_equal(true)
    response.invitations.size.must_equal(2)
    response.invitations.must_include(invitation1)
    response.invitations.must_include(invitation2)
    response.invitations.wont_include(invitation3)
  end
  
  it "returns no Invitations if we pass an invalid event id" do
    invitation1 = Invitation.create_valid!
    response = ListInvitation.new(:event_id => 0).exec
    response.ok?.must_equal(true)
    response.invitations.size.must_equal(0)
  end

end

