# -*- coding: UTF-8 -*-

module UseCases

  class SeedStorage < UseCase

    def exec
      destroy_gatherings_events
      create_gatherings_events
      Response.new
    end

    private

    def destroy_gatherings_events
      db[Event].all.each { |event| db[event].destroy }
      db[Gathering].all.each { |event| db[event].destroy }
    end

    def create_gatherings_events
      SEED_GATHERINGS_EVENTS.each do |seed_gathering|
        #puts "########GATHERING!\n#{seed_gathering}\n#######END GATHERING!"
        gathering = Gathering.new(
          :name => seed_gathering[:name],
          :description => seed_gathering[:description],
          :gathering_type => seed_gathering[:gathering_type]
        ) 
        
        if gathering.valid? 
          db[gathering].save
        
          seed_gathering[:events].each do |seed_event|
            #puts "########EVENT!\n#{seed_event}\n#######END EVENT!"
            event = Event.new(
              :name => seed_event[:name],
              :description => seed_event[:description],
              :date_time => seed_event[:date_time],
              :location => seed_event[:location],
              :gathering_id => gathering.id
            )
            
            if event.valid?
              db[event].save
            end
          end
        end
      end
    end

    SEED_GATHERINGS_EVENTS = [
      {
        :name => "April_Showers_Fun",
        :description => "Come enjoy the showers in April with some fun in the garden",
        :gathering_type => "Party",
        :events => [
          {
            :name => "Reception",
            :description => "Enjoy some refreshments to energize you before getting to work!",
            :date_time => Time.new("4/4/2013 9:00"),
            :location => "Main Lobby"
          },
          {
            :name => "Fun in the Garden",
            :description => "Get down to business and start sprucing up the community garden!  Everyone will be assigned different duties according to their skillsets and hopefully desire (note that we can't provide everyone with the job they might like the most).",
            :date_time => Time.new("4/4/2013 9:30"),
            :location => "Community Garden"
          },
          {
            :name => "Cleanup",
            :description => "Finish up any half-done projects and clean up all tools and food/drink",
            :date_time => Time.new("4/4/2013 12:30"),
            :location => "Everywhere!"
          }
        ]
      },
      {
        :name => "Jane_John_Doe_Wedding",
        :description => "Jane and John finally get married after having the same last names for what seems like forever!",
        :gathering_type => "Wedding",
        :events => [
          {
            :name => "Rehearsal and Dinner",
            :description => "The wedding party is requested to join us for the rehearsal",
            :date_time => Time.new("6/2/2013 17:00"),
            :location => "Tom's Bistro - 111 W Tom Ave, Tomopolis, TM"
          },
          {
            :name => "Scavenger hunt",
            :description => "Everyone is invited to attend a scavenger hunt around downtown Portland!  Winners will receive gifts!",
            :date_time => Time.new("6/2/2013 9:00"),
            :location => "Meet at 66 W Downtown Lane at 9AM sharp for details (we'll provide umbrellas if you don't have one availabe!)"
          },
          {
            :name => "Welcome Picnic",
            :description => "Meet us in the park for a delicious barbecue picnic!  We will be providing food options for Omnivores, Herbivores, Vegans, and Gluten-Free diets. A shuttle will be provided at 44 W Main St every 15-20 minutes starting at 11:30AM.  Public transportation is also available if you refer to Google Maps :)",
            :date_time => Time.new("6/2/2013 12:00"),
            :location => "Big Park - 1820 W Park Lane"
          },
          {
            :name => "Ceremony and Reception",
            :description => "Join us for the main event! Reception to immediately follow in the same location, so no need to travel.  Dress is business casual so no need for a suit/dress/tie/etc!",
            :date_time => Time.new("6/3/2013 5:00"),
            :location => "Sweet Space - <3 <3"
          }
        ]
      }
    ]


  end

end
