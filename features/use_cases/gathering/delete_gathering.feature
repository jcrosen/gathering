# -*- coding: UTF-8 -*-

Feature: Delete a gathering
  As a gathering organizer
  In order to correct a mistake with an incorrectly entered gathering
  I need to delete it
  
  Background:
    Given a gathering exists
    
  Scenario: Delete a gathering without events
    When I delete a gathering without events
    Then I receive no errors
    And the gathering is no longer persisted
  
  Scenario: Delete a gathering with events
    When I delete a gathering with events
    Then I receive an error
    And the error references existing events
    And the gathering is still persisted