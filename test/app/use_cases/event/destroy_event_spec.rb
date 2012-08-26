# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
include ApplicationWatch
  
describe DestroyEvent do
  
  it "destroys an existing Event" do
    event = Event.create_valid!
    response = DestroyEvent.new(:id => event.id).exec
    response.ok?.must_equal(true)
    response.event.destroyed?.must_equal(true)
    lambda { db[Event].find(event.id) }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end
  
  it "raises an exception if the Event does not exist for destruction" do
    lambda{ DestroyEvent.new(:id => -1).exec}.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

