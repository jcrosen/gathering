# -*- coding: UTF-8 -*-

require 'app_test_helper'
include UseCases
include Entities
include ApplicationWatch

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

Given /^a gathering exists$/ do
  @gathering = Gathering.create_valid!
end

def valid_attributes
  Event.valid_attributes.merge(:gathering_id => @gathering.id)
end

When /^I create a valid event$/ do
  @response = CreateEvent.new(:atts => valid_attributes).exec
  @event = @response.event
end

When /^I create an event with a non-existent gathering$/ do
  @response = CreateEvent.new(:atts => valid_attributes.merge(:gathering_id => -1)).exec
  @event = @response.event
end

Then /^I receive no errors$/ do
  @response.ok?.must_equal(true)
end

Then /^I receive an error$/ do
  @response.ok?.must_equal(true)
  @response.errors.wont_be_nil
end

And /^attempt to create another event with the same name$/ do
  @response = CreateEvent.new(:atts => valid_attributes.merge(:name => @event.name) ).exec
end

And /^the event is persisted$/ do
  @event.new_record?.must_equal(false)
end
