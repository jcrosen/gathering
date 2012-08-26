# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
  
describe NewEvent do

  # Merely testing that the new call works, not that the entity created is valid; see the CreateGathering test for this
  it "creates a new Event with default attributes" do
    response = NewEvent.new.exec
    response.event.wont_be_nil 
  end

end

