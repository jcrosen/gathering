# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
  
describe UpdateGathering do

  it "successfully updates and persists an existing Gathering with valid attributes" do
    gathering = Gathering.create_valid!
    new_atts = {:name => "New Name", :description => "New Description", :type => "New Type"}
    
    response = UpdateGathering.new(:id => gathering.id, :atts => new_atts).exec
    response.ok?.must_equal(true)
    response.gathering.name.must_equal(new_atts[:name])
    response.gathering.description.must_equal(new_atts[:description])
    response.gathering.type.must_equal(new_atts[:type])
  end
  
  it "returns errors if we attempt to update a gathering with invalid attributes" do
    gathering = Gathering.create_valid!
    new_atts = {:name => nil, :description => "New Description", :type => "New Type"}
    
    response = UpdateGathering.new(:id => gathering.id, :atts => new_atts).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "raises an exception if attempting to update a gathering that does not exist" do
    lambda { UpdateGathering.new(:id => -1, :atts => {}).exec }.must_raise(RubyPersistenceAPI::ObjectNotFound)
  end

end

