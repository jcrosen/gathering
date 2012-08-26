# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
include Entities
  
describe CreateEvent do
  
  def valid_attributes
    gathering = Gathering.create_valid!
    {
      :name => "Rehearsal Dinner",
      :description => "The rehearsal dinner will be provided at sdlkfjweokc.",
      :date_time => Time.new('6/1/2013 17:00'),
      :gathering_id => gathering.id,
      :location => "100 Main St, Anywhere, US - Above the landing"
    }
  end

  it "successfully creates and persists a new Event" do
    atts = valid_attributes
    response = CreateEvent.new(:atts => atts).exec
    
    response.ok?.must_equal(true)
    event = response.event
    event.id.wont_be_nil
    event.name.must_equal(atts[:name])
    event.description.must_equal(atts[:description])
    event.date_time.must_equal(atts[:date_time])
    event.gathering_id.must_equal(atts[:gathering_id])
    event.location.must_equal(atts[:location])
  end
  
  it "returns errors if the create Event request is not valid" do
    response = CreateEvent.new(:atts => valid_attributes.merge(:name => "")).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "returns an exception if the Event has a Gathering id that does not exist" do
    lambda { CreateEvent.new(:atts => valid_attributes.merge(:gathering_id => -1)).exec }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

