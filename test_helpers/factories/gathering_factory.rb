# -*- encoding : utf-8 -*-

module GatheringFactory

  include Factory

  def valid_attributes
    random_name = RandomString.generate(10).camelcase
    random_desc = RandomString.generate(30).camelcase

    {
        :name => "#{random_name}",
        :description => "#{random_desc}",
        :gathering_type => "Wedding"
    }
  end

end

Entities::Gathering.extend(GatheringFactory)
