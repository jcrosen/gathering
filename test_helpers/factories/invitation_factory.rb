# -*- encoding : utf-8 -*-

module InvitationFactory
  
  include Factory

  def valid_attributes
    random_email = "#{RandomString.generate(40)}@#{RandomString.generate(30)}.com"
    random_status = RandomString.generate(10).camelcase
    random_token = RandomString.generate(50).camelcase
    event = Event.create_valid!
    {
        :email => "#{random_email}",
        :status => "#{random_status}",
        :token => "#{random_token}",
        :event_id => event.id
    }
  end

end

Entities::Invitation.extend(InvitationFactory)
