# -*- coding: UTF-8 -*-

Feature: Create new event
  As a gathering organizer
  In order to communicate details about events at a future gathering
  I need to create them
  
  Background:
    Given a gathering exists
  
  Scenario: Create a valid event
    When I create a valid event
    Then I receive no errors
    And the event is persisted

  # We're testing the non-existent gathering here because the event entity does not know about this condition, only the use case does
  Scenario: Create an event without a gathering
    When I create an event with a non-existent gathering
    Then I receive an error
  
  Scenario: Create a duplicate event on the same gathering
    When I create a valid event
    And attempt to create another event with the same name
    Then I receive an error