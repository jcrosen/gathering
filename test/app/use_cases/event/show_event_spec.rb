# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe ShowEvent do
  
  it "returns the desired Event for edit" do
    event = Event.create_valid!
    response = ShowEvent.new(:id => event.id).exec
    response.ok?.must_equal(true)
    response.event.must_equal(event)
    response.event.id.must_equal(event.id)
  end
  
  it "returns exception if the Event does not exist for edit" do
    lambda { ShowEvent.new(:id => -1).exec }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

