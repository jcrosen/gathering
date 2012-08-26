# -*- encoding : utf-8 -*-

module Entities
  
  class Event < Entity
    
    attribute :id, type: Integer
    attribute :name, :type => String
    attribute :description, :type => String
    attribute :gathering_id, :type => Integer
    attribute :date_time, :type => DateTime
    attribute :location, :type => String
    
    validates :name, :presence => true
    validates :description, :presence => true
    validates :gathering_id, :presence => true
    validates :date_time, :presence => true
    validates :location, :presence => true
  end
end