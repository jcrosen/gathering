# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe EditEvent do
  
  it "returns the desired Event for edit" do
    event = Event.create_valid!
    response = EditEvent.new(:id => event.id).exec
    response.ok?.must_equal(true)
    response.event.must_equal(event)
    response.event.id.must_equal(event.id)
  end
  
  it "returns exception if the Event does not exist for edit" do
    lambda { EditEvent.new(:id => -1).exec }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

