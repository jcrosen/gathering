# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe ShowGathering do
  
  it "returns the desired gathering for show" do
    gathering = Gathering.create_valid!
    response = EditGathering.new(:id => gathering.id).exec
    response.ok?.must_equal(true)
    response.gathering.must_equal(gathering)
    response.gathering.id.must_equal(gathering.id)
  end
  
  it "returns errors if the Gathering does not exist for show" do
    lambda { EditGathering.new(:id => -1).exec }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

