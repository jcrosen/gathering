# -*- coding: UTF-8 -*-

require 'app_test_helper'
include Entities

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

When /^I create a new gathering without event details$/ do
  pending
end

Then /^the gathering is persisted$/ do
  pending
end

And /^the event details are persisted$/ do
  pending
end

And /^a default event is created for the gathering$/ do
  pending
end

When /^I create a new gathering with event details$/ do
  pending
end

When /^I delete a gathering without events$/ do
  pending  
end

Then /^I receive no gathering errors$/ do
  pending
end

And /^the gathering is no longer persisted$/ do
  pending
end

When /^I delete a gathering with events$/ do
  pending
end

Then /^I receive a gathering error$/ do
  pending
end

And /^the error references existing events$/ do
  pending
end

And /^the gathering is still persisted$/ do
  pending
end