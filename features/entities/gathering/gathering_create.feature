# -*- coding: UTF-8 -*-

Feature: Create new gathering
  As a gathering organizer
  In order to communicate details about a future gathering
  I need to create it
  
  Background:
    Given a gathering does not exist
  
  Scenario: Create a new valid gathering
    When I create a valid gathering
    Then the gathering is valid

  Scenario: Create a new valid gathering without a specified type
    When I create a valid gathering without a specified type
    Then the gathering type should be the default type
    
  Scenario: Create a new valid gathering with a specified type
    When I create a valid gathering with a specified type
    Then the gathering type should be the specified type
