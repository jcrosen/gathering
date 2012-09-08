# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
include ApplicationWatch
  
describe DestroyInvitation do
  
  it "destroys an existing Invitation" do
    invitation = Invitation.create_valid!
    response = DestroyInvitation.new(:id => invitation.id).exec
    response.ok?.must_equal(true)
    response.invitation.destroyed?.must_equal(true)
    lambda { db[Invitation].find(invitation.id) }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end
  
  it "raises an exception if the Invitation does not exist for destruction" do
    lambda{ DestroyInvitation.new(:id => -1).exec}.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

