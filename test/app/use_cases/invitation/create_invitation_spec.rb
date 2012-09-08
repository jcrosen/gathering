# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe CreateInvitation do
  
  def valid_attributes
    Invitation.valid_attributes
  end

  it "successfully creates and persists a new Invitation" do
    atts = valid_attributes
    response = CreateInvitation.new(:atts => atts).exec
    
    response.ok?.must_equal(true)
    invitation = response.invitation
    invitation.id.wont_be_nil
    invitation.email.must_equal(atts[:email])
    invitation.status.must_equal(atts[:status])
    invitation.token.must_equal(atts[:token])
    invitation.event_id.must_equal(atts[:event_id])
  end
  
  it "returns errors if the create Invitation request is not valid" do
    response = CreateInvitation.new(:atts => valid_attributes.merge(:email => "")).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "returns an error if the Invitation has an Event id that does not exist" do
    response = CreateInvitation.new(:atts => valid_attributes.merge(:event_id => -1)).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "sets a default status of new if none is passed in" do
    response = CreateInvitation.new(:atts => valid_attributes.merge(:status => nil)).exec
    response.ok?.must_equal(true)
    response.invitation.new?.must_equal(true)
  end

end

