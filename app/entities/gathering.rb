# -*- coding: UTF-8 -*-

module Entities

  class Gathering < Entity

    BUILT_IN_TYPES = ["Gathering", "Wedding", "Birthday", "Party", "Funeral"]
    
    public
    attribute :id, :type => Integer
    attribute :name, :type => String
    attribute :description, :type => String
    attribute :gathering_type, :type => String, :default => "Gathering" #BUILT_IN_TYPES.first
    
    validates :name, :presence => true, :uniqueness => true
    validates :description, :presence => true
    validates :gathering_type, :presence => true
  end
end