# -*- encoding : utf-8 -*-

module GatheringFactory

  include Factory

  def valid_attributes
    random_name = RandomString.generate.camelcase

    {
        name: "#{random_name}"
    }
  end

end

Entities::Gathering.extend(GatheringFactory)
