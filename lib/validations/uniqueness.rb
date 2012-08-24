# -*- coding: UTF-8 -*-
require 'active_model'

module Validations

  class UniquenessValidator < ActiveModel::EachValidator

    def validate_each(object, attribute, value)
      db = Application.instance.config.backend # hack to retrieve otherwise private db; entity needs db to check if it's unique
      # If db isn't properly configured this will return an error
      if db.nil?
        object.errors.add(attribute, 'backend not properly instantiated, unable to validate uniqueness')
      elsif db[object.class].where(attribute => value).where_not(id: object.id).first
        object.errors.add(attribute, :taken, options.merge(value: value))
      end
    end

  end

end
