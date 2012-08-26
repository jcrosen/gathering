# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
  
describe NewGathering do

  # Merely testing that the new call works, not that the entity created is valid; see the CreateGathering test for this
  it "creates a new Gathering with default attributes" do
    response = NewGathering.new.exec
    response.gathering.wont_be_nil 
  end

end

