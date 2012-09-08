# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe ListEvent do
  
  it "returns all Events that have been persisted" do
    event1 = Event.create_valid!
    event2 = Event.create_valid!
    event3 = Event.new
    response = ListEvent.new.exec
    response.ok?.must_equal(true)
    response.events.size.must_equal(2)
    response.events.must_include(event1)
    response.events.must_include(event2)
    response.events.wont_include(event3)
  end
  
  it "returns all Events that have been persisted with the specified gathering" do
    event1 = Event.create_valid!
    event2 = Event.create_valid!(:gathering_id => event1.gathering_id)
    event3 = Event.create_valid!
    response = ListEvent.new(:gathering_id => event1.gathering_id).exec
    response.ok?.must_equal(true)
    response.events.size.must_equal(2)
    response.events.must_include(event1)
    response.events.must_include(event2)
    response.events.wont_include(event3)
  end

end

