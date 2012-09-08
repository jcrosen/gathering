# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
  
describe NewInvitation do

  # Merely testing that the new call works, not that the entity created is valid; see the CreateGathering test for this
  it "creates a new Invitation with default attributes" do
    response = NewInvitation.new.exec
    response.invitation.wont_be_nil 
  end

end

