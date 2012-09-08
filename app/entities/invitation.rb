# -*- encoding : utf-8 -*-

module Entities
  
  class Invitation < Entity
    
    attribute :id, :type => Integer
    attribute :email, :type => String
    attribute :status, :type => String
    attribute :event_id, :type => Integer
    attribute :token, :type => String
    attribute :sent_at, :type => DateTime
    
    validates :email, :presence => true
    validates :status, :presence => true
    validates :event_id, :presence => true
    validates :token, :presence => true
    validates :email, :uniqueness => {:scope => [:event_id]}
    
    STATUS_LIST = %w[new unconfirmed attending not_attending cancelled]
    
    def sent?
      !sent_at.nil?
    end
    
    # "Meta-programming" for dynamic-ish statuses
    #START
      # Accessors and Setters
      STATUS_LIST.each do |status_name|
        define_method "#{status_name}?" do
          status == status_name
        end
        
        define_method "set_status_to_#{status_name}" do
          self.status = status_name
        end
      end
    #END Meta-Programming
    
    def self.status_list
      STATUS_LIST
    end
    
  end
end