# -*- coding: UTF-8 -*-

Feature: Cancel an event
  As a gathering organizer
  In order to communicate an event cancellation
  I need to cancel it
    
  Scenario: Cancel an event
    When I cancel an event
    Then the event status is cancelled
    And the event invitations are also cancelled
    And the event is still persisted