# -*- coding: UTF-8 -*-

require 'app_test_helper'

include UseCases
  
describe CreateGathering do
  
  def valid_attributes
    {
      :name => "Jane and John Doe Wedding",
      :description => "Jane and John Doe symbolically join their lives in the summer of 2013",
      :gathering_type => "Wedding"
    }
  end

  it "successfully creates and persists a new Gathering" do
    response = CreateGathering.new(:atts => valid_attributes).exec
    
    response.ok?.must_equal(true)
    gathering = response.gathering
    gathering.id.wont_be_nil
    gathering.name.must_equal(valid_attributes[:name])
    gathering.description.must_equal(valid_attributes[:description])
    gathering.gathering_type.must_equal(valid_attributes[:gathering_type])
    
  end
  
  it "returns errors if the create Gathering request is not valid" do
    response = CreateGathering.new(:atts => valid_attributes.merge(:name => "")).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end
  
  it "returns errors if creating Gathering with a duplicate name" do
    gathering_orig = CreateGathering.new(:atts => valid_attributes).exec.gathering
    response = CreateGathering.new(:atts => valid_attributes.merge(:name => gathering_orig.name)).exec
    response.ok?.must_equal(false)
    response.errors.wont_be_nil
  end

end

