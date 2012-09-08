# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
  
describe UpdateEvent do

  it "successfully updates and persists an existing Event with valid attributes" do
    event = Event.create_valid!
    gathering = Gathering.create_valid!
    new_atts = {:name => "New Name", :description => "New Description", :date_time => Time.new("6/22/2014 14:40"), :gathering_id => gathering.id, :location => "100 Main St, Anywhere, US - Above the landing"}
    
    response = UpdateEvent.new(:id => event.id, :atts => new_atts).exec
    response.ok?.must_equal(true)
    response.event.name.must_equal(new_atts[:name])
    response.event.description.must_equal(new_atts[:description])
    response.event.date_time.must_equal(new_atts[:date_time])
    response.event.gathering_id.must_equal(new_atts[:gathering_id])
    response.event.location.must_equal(new_atts[:location])
  end
  
  it "returns errors if we attempt to update an Event with invalid attributes" do
    event = Event.create_valid!
    new_atts = {:name => nil, :description => "New Description", :date_time => Time.new("6/1/2014 14:40"), :gathering_id => event.gathering_id, :location => "New Location"}
    
    response = UpdateEvent.new(:id => event.id, :atts => new_atts).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "returns an error if attempting to update an Event that does not exist" do
    response = UpdateEvent.new(:id => -1, :atts => {}).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "returns an error if attempting to update an Event with a Gathering that does not exist" do
    event = Event.create_valid!
    new_atts = {:name => "New Name", :description => "New Description", :date_time => Time.new("6/1/2014 14:40"), :gathering_id => -1, :location => "New Location"}
    response = UpdateEvent.new(:id => event.id, :atts => new_atts).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end

end

