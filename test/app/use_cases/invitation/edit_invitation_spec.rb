# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe EditInvitation do
  
  it "returns the desired Invitation for edit" do
    invitation = Invitation.create_valid!
    response = EditInvitation.new(:id => invitation.id).exec
    response.ok?.must_equal(true)
    response.invitation.must_equal(invitation)
    response.invitation.id.must_equal(invitation.id)
  end
  
  it "returns exception if the Invitation does not exist for edit" do
    lambda { EditInvitation.new(:id => -1).exec }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

