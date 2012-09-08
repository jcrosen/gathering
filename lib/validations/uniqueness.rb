# -*- coding: UTF-8 -*-
require 'active_model'

module Validations

  class UniquenessValidator < ActiveModel::EachValidator

    def validate_each(object, attribute, value)
      db = Application.instance.config.backend # hack to retrieve otherwise private db; entity needs db to check if it's unique
      
      # Build the where attribute list, it will always use the chosen attribute but will add optional scope fields
      # For example:
      #   An Event class has a unique name with no optional scope supplied
      #     So if you have any two events with the same name you will trigger a validation error
      #   An Invite class has a unique email with an optional scope of event_id (you can have multiple invites to the same email across different events)
      #     So if you have two invites to the same email on the same event you will trigger a validation error, if the events are different then there is no error 
      #
      where_atts = {attribute => value}
      if scope = options[:scope]
        # Hach to turn this into an array if it isn't already so the each method doesn't fail below
        if scope.class != Array
          scope = [scope]
        end
        
        scope.each do |field|
          where_atts[field] = object.send(field)
        end
      end
      
      # If db isn't properly configured this will return an error
      if db.nil?
        object.errors.add(attribute, 'backend not properly instantiated, unable to validate uniqueness')
      elsif db[object.class].where(where_atts).where_not(:id => object.id).first
        object.errors.add(attribute, :taken, options.merge(:value => value))
      end
    end

  end

end
