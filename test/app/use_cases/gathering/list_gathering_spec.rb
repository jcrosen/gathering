# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe ListGathering do
  
  it "returns all Gatherings that have been persisted" do
    gathering1 = Gathering.create_valid!
    gathering2 = Gathering.create_valid!
    gathering3 = Gathering.new
    response = ListGathering.new.exec
    response.ok?.must_equal(true)
    response.gatherings.size.must_equal(2)
    response.gatherings.must_include(gathering1)
    response.gatherings.must_include(gathering2)
    response.gatherings.wont_include(gathering3)
  end

end

