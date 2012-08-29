# -*- coding: UTF-8 -*-

require 'app_test_helper'
include Entities

World(MiniTest::Assertions)
MiniTest::Spec.new(nil)

def destroy_gathering
  @gathering = nil
end

def specified_gathering_type
  "Wedding"
end

Given /^a gathering does not exist$/ do
  destroy_gathering
end

When /^I create a valid gathering$/ do
  @gathering = Gathering.new_valid
end

When /^I create a valid gathering with a specified type$/ do
  @gathering = Gathering.new_valid(:gathering_type => specified_gathering_type)
end

When /^I create a valid gathering without a specified type$/ do
  atts = Gathering.valid_attributes
  atts.delete(:gathering_type)
  @gathering = Gathering.new(atts)
end

Then /^the gathering is valid$/ do
  @gathering.valid?.must_equal(true)
end

Then /^the gathering type should be the default type$/ do
  @gathering.gathering_type.must_equal(@gathering.attribute_defaults["gathering_type"])
end

Then /^the gathering type should be the specified type$/ do
  @gathering.gathering_type.must_equal(specified_gathering_type)
end
