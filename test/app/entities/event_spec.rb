# -*- encoding : utf-8 -*-

require 'app_test_helper'
include Entities

describe Event do
  it "is valid with valid attributes" do
    Event.new_valid.valid?.must_equal(true)
  end
  it "is invalid without a name" do
    Event.new_valid(:name => nil).valid?.must_equal(false)
  end
  it "is invalid without a description" do
    Event.new_valid(:description => nil).valid?.must_equal(false)
  end
  it "is invalid without a date and time" do
    Event.new_valid(:date_time => nil).valid?.must_equal(false)
  end
  it "is invalid without a location" do
    Event.new_valid(:location => nil).valid?.must_equal(false)
  end
  it "is invalid without a gathering" do
    Event.new_valid(:gathering_id => nil).valid?.must_equal(false)
  end
end