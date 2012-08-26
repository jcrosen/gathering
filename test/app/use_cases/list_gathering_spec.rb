# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe ListGathering do
  
  it "returns the desired gathering for edit" do
    gathering1 = Gathering.create_valid!
    gathering2 = Gathering.create_valid!
    response = ListGathering.new.exec
    response.ok?.must_equal(true)
    response.gatherings.size.must_equal(2)
    response.gatherings.must_include(gathering1)
    response.gatherings.must_include(gathering2)
  end

end

