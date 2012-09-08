# -*- encoding : utf-8 -*-

require 'app_test_helper'
include Entities

describe Invitation do
  it "is valid with valid attributes" do
    Invitation.new_valid.valid?.must_equal(true)
  end
  it "is invalid without an event" do
    Invitation.new_valid(:event_id => nil).valid?.must_equal(false)
  end
  it "is invalid without an email" do
    Invitation.new_valid(:email => nil).valid?.must_equal(false)
  end
  it "is invalid without a status" do
    Invitation.new_valid(:status => nil).valid?.must_equal(false)
  end
  it "has pre-defined status values" do
    Invitation.status_list.wont_be_nil
  end
  it "has working check and set methods for each of the pre-defined status values" do
    invitation = Invitation.new_valid
    Invitation.status_list.each do |status_name|
      invitation.must_respond_to("#{status_name}?")
      invitation.must_respond_to("set_status_to_#{status_name}")
    end
  end
  it "properly sets and retreives the status with the pre-defined status methods" do
    invitation = Invitation.new_valid
    Invitation.status_list.each do |status_name|
      invitation.send("set_status_to_#{status_name}")
      invitation.status.must_equal(status_name)
      invitation.send("#{status_name}?").must_equal(true)
    end
  end
  it "optionally has a sent_at date value" do
    invitation = Invitation.new_valid
    invitation.sent_at.must_be_nil
    invitation = Invitation.new_valid(:sent_at => Time.now)
    invitation.sent_at.wont_be_nil
    invitation.sent_at.must_be_instance_of(DateTime)
  end
  it "returns true for sent? when sent_at is populated" do
    invitation = Invitation.new_valid(:sent_at => Time.now)
    invitation.sent?.must_equal(true)
    invitation = Invitation.new_valid
    invitation.sent?.must_equal(false)
  end
end