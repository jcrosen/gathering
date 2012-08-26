# -*- coding: UTF-8 -*-

Feature: Create new event
  As a gathering organizer
  In order to communicate details about events at a future gathering
  I need to create them
  
  Scenario: Create a new valid event
    When I create a valid event
    Then the event is valid

  # Unsure if this feature should live in the entity or the use case for creating an event, I suspect that we'll move it from here because the implementation will keep the entities "stupid" in that they don't know much about other entities 
  Scenario: Create a new valid event with a gathering_id that does not exist
    When I create a valid event
    And the event gathering does not exist
    Then the event is not valid