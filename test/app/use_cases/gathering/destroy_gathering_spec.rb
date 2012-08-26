# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
include ApplicationWatch
  
describe DestroyGathering do
  
  it "destroys an existing gathering" do
    gathering = Gathering.create_valid!
    response = DestroyGathering.new(:id => gathering.id).exec
    response.ok?.must_equal(true)
    response.gathering.destroyed?.must_equal(true)
    lambda { db[Gathering].find(gathering.id) }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end
  
  it "raises an exception if the gathering does not exist for destruction" do
    lambda{ DestroyGathering.new(:id => -1).exec}.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

