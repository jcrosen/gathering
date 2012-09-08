# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe ConfirmInvitation do
  
  def attending_status
    "attending"
  end

  it "successfully confirms an invitation with the requested valid status and a valid token" do
    invitation = Invitation.create_valid!
    
    response = ConfirmInvitation.new(:id => invitation.id, :token => invitation.token, :status => attending_status).exec
    response.ok?.must_equal(true)
    invitation = response.invitation
    invitation.id.wont_be_nil
    invitation.status.must_equal(attending_status)
  end
  
  it "returns an error if confirming an invitation with an invalid token" do
    invitation = Invitation.create_valid!
    response = ConfirmInvitation.new(:id => invitation.id, :token => "invalid_token", :status => attending_status).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
    response.errors.must_include(:invalid_token)
  end
  
  it "returns an error if confirming an invitation with an invalid status" do
    invitation = Invitation.create_valid!
    response = ConfirmInvitation.new(:id => invitation.id, :token => invitation.token, :status => "invalid_status").exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
    response.errors.must_include(:invalid_value)
  end
  
  it "returns an error if the invitation id doesn't exist" do
    invitation = Invitation.create_valid!
    response = ConfirmInvitation.new(:id => 0, :token => invitation.token, :status => attending_status).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
    response.errors.must_include(:object_not_found)
  end

end

