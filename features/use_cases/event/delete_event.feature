# -*- coding: UTF-8 -*-

Feature: Delete an event
  As a gathering organizer
  In order to correct a mistake with an incorrectly created event
  I need to delete it
    
  Scenario: Delete an event without invitations
    When I delete an event without invitations
    Then I receive no event errors
    And the event is no longer persisted
  
  Scenario: Delete an event with invitations
    When I delete an event with invitations
    Then I receive an event error
    And the error references existing invitations
    And the event is still persisted