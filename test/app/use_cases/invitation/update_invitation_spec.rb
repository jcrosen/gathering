# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
  
describe UpdateInvitation do

  it "successfully updates and persists an existing Invitation with valid attributes" do
    invitation = Invitation.create_valid!
    new_atts = Invitation.valid_attributes.merge(:event_id => invitation.event_id)
    
    response = UpdateInvitation.new(:id => invitation.id, :atts => new_atts).exec
    response.ok?.must_equal(true)
    response.invitation.email.must_equal(new_atts[:email])
    response.invitation.status.must_equal(new_atts[:status])
    response.invitation.token.must_equal(new_atts[:token])
    response.invitation.event_id.must_equal(new_atts[:event_id])
  end
  
  it "returns errors if we attempt to update an Invitation with invalid attributes" do
    invitation = Invitation.create_valid!
    new_atts = Invitation.valid_attributes.merge(:email => nil, :event_id => invitation.event_id)
    
    response = UpdateInvitation.new(:id => invitation.id, :atts => new_atts).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "returns an error if attempting to update an Invitation that does not exist" do
    response = UpdateInvitation.new(:id => -1, :atts => {}).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "returns an error if attempting to update an Invitation with a Gathering that does not exist" do
    invitation = Invitation.create_valid!
    new_atts = Invitation.valid_attributes.merge(:event_id => -1)
    response = UpdateInvitation.new(:id => invitation.id, :atts => new_atts).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end

end

