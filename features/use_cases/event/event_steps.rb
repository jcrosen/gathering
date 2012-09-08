# -*- coding: UTF-8 -*-

require 'app_test_helper'
include UseCases
include Entities
include ApplicationWatch

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

def valid_attributes
  Event.valid_attributes.merge(:gathering_id => @gathering.id)
end

def db
  Application.instance.config.backend
end

Before do
  @_new_event = Event.create_valid!
end

Given /^a gathering exists$/ do
  @gathering = Gathering.create_valid!
end

When /^I create a valid event$/ do
  @response = CreateEvent.new(:atts => valid_attributes).exec
  @event = @response.event
end

When /^I create an event with a non-existent gathering$/ do
  @response = CreateEvent.new(:atts => valid_attributes.merge(:gathering_id => -1)).exec
  @event = @response.event
end

When /^I delete an event without invitations$/ do
  db[Invitation].where(:event_id => @_new_event.id).all.each do |invitation|
    db[invitation].destroy
  end
  @response = DestroyEvent.new(:id => @_new_event.id).exec
  @event = @response.event
end

When /^I delete an event with invitations$/ do
  Invitation.create_valid!(:event_id => @_new_event.id)
  @response = DestroyEvent.new(:id => @_new_event.id).exec
  @event = @response.event
end

Then /^I receive no event errors$/ do
  @response.ok?.must_equal(true)
end

Then /^I receive an event error$/ do
  @response.ok?.must_equal(false)
  @response.errors.wont_be_nil
end

And /^attempt to create another event with the same name$/ do
  @response = CreateEvent.new(:atts => valid_attributes.merge(:name => @event.name) ).exec
end

And /^the event is persisted$/ do
  @event.persisted?.must_equal(true)
end

Then /^the event is no longer persisted$/ do
  @event.persisted?.must_equal(false)
end

When /^I cancel an event$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the event status is cancelled$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the event invitations are also cancelled$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the event is still persisted$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the error references existing invitations$/ do
  pending # express the regexp above with the code you wish you had
end
