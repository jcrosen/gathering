# -*- encoding : utf-8 -*-

module EventFactory

  include Factory

  def valid_attributes
    random_name = RandomString.generate(10).camelcase
    random_desc = RandomString.generate(30).camelcase
    gathering = Gathering.create_valid!

    {
        :name => "#{random_name}",
        :description => "#{random_desc}",
        :date_time => Time.new,
        :gathering_id => gathering.id
    }
  end

end

Entities::Event.extend(EventFactory)
