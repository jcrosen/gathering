# -*- coding: UTF-8 -*-

Feature: Create a Gathering
  As a gathering organizer
  In order to communicate details about a future gathering
  I need to create it
  
  Scenario: Create a gathering with event details
    When I create a new gathering with event details
    Then the gathering is persisted
    And the event details are persisted

  Scenario: Create a gathering with the default event
    When I create a new gathering without event details
    Then the gathering is persisted
    And a default event is created for the gathering