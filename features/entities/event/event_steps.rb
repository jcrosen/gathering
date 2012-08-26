# -*- coding: UTF-8 -*-

require 'app_test_helper'
include Entities

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

When /^I create a valid event$/ do
  @event = Event.new_valid
end

And /^the event gathering does not exist$/ do
  @event.gathering_id = -1 #Assuming that primary keys are always positive
end

Then /^the event is valid$/ do
  @event.valid?.must_equal(true)
end

Then /^the event is not valid$/ do
  @event.valid?.must_equal(false)
end
