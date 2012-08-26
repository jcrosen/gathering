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

end

