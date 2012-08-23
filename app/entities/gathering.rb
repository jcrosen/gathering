
module Entities

  class Gathering < Entity
  
      attribute :id, type: Integer
      attribute :name, type: String
      attribute :description, type: String
      attribute :type, type: String
      
      validates :name, presence: true, uniqueness: true
      validates :description, presence: true
      validates :type, presence: true
  
      TYPES = ["Gathering", "Wedding", "Birthday", "Party", "Funeral"]
  
      def initialize(name=nil, description=nil, type=nil)
          @name = name
          @description = description
          @type = "Gathering"
      end
  
      def valid?
          !(@name.nil? or @description.nil?)
      end
  
      def type
          if TYPES.include? @type
              @type
          else
              "Other"
          end
      end
      def type_description
          @type
      end
  
      protected
      def self.TYPES
          TYPES
      end
  end
end