# -*- coding: UTF-8 -*-

module Entities

  class Gathering < Entity

    BUILT_IN_TYPES = ["Gathering", "Wedding", "Birthday", "Party", "Funeral"]
    
    public
    attribute :id, :type => Integer
    attribute :name, :type => String
    attribute :description, :type => String
    attribute :gathering_type, :type => String, :default => "Gathering" #BUILT_IN_TYPES.first
    
    validates :name, presence: true  #TODO: Update this to have uniqueness validator once we have a configured backend that can validate, uniqueness: true
    validates :description, presence: true
    validates :gathering_type, presence: true
  
#   
      # def initialize(name=nil, description=nil, type=nil)
          # @name = name
          # @description = description
          # @type = "Gathering"
      # end
#   
      # def valid?
          # !(@name.nil? or @description.nil?)
      # end
#   
      # def type
          # if TYPES.include? @type
              # @type
          # else
              # "Other"
          # end
      # end
      # def type_description
          # @type
      # end
#   

    # def self.BUILT_IN_TYPES
        # BUILT_IN_TYPES.dup
    # end
  end
end