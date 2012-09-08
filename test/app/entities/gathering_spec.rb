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
    Gathering.new_valid(:gathering_type => nil).valid?.must_equal(false)
  end
  it "has a default value for gathering type" do
    Gathering.new.gathering_type.wont_be_nil
  end
  it "is invalid if it has a duplicate name" do
    gathering_orig = Gathering.create_valid!
    gathering_dup = Gathering.new_valid(:name => gathering_orig.name)
    gathering_dup.valid?.must_equal(false)
  end
end
