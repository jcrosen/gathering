# -*- encoding : utf-8 -*-

require 'app_test_helper'
include Entities

describe Gathering do
  it "is valid with valid attributes" do
    Gathering.new_valid.valid?.must_equal(true)
  end
  it "is invalid without a name" do
    Gathering.new_valid(:name => nil).valid?.must_equal(false)
  end
  it "is invalid without a description" do
    Gathering.new_valid(:description => nil).valid?.must_equal(false)
  end
  it "is invalid without a type" do
    Gathering.new_valid(:type => nil).valid?.must_equal(false)
  end
end
