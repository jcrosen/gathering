# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe EditGathering do
  
  it "returns the desired gathering for edit" do
    gathering = Gathering.create_valid!
    response = EditGathering.new(:id => gathering.id).exec
    response.ok?.must_equal(true)
    response.gathering.must_equal(gathering)
    response.gathering.id.must_equal(gathering.id)
  end
  
  it "returns exception if the Gathering does not exist for edit" do
    lambda { EditGathering.new(:id => -1).exec }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

