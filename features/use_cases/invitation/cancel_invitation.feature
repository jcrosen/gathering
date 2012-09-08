# -*- coding: UTF-8 -*-

Feature: Cancel an invititation
  As a gathering organizer
  In order to remove a sent invitation
  I need to cancel it
  
  Background:
    Given a sent invitation exists
    
  Scenario: Cancel an invitation
    When I cancel an invitation
    Then the invitation status is cancelled
    And the cancellation is sent