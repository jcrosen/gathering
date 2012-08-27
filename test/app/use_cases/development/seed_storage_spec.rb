# -*- encoding : utf-8 -*-

require 'app_test_helper'
include Entities
include UseCases

describe SeedStorage do
  it "seeds the database" do
    SeedStorage.new.exec
    db[Gathering].all.wont_be_empty
    db[Event].all.wont_be_empty
  end
end