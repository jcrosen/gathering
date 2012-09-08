# -*- coding: UTF-8 -*-

Feature: Create new invititation
  As a gathering organizer
  In order to extend an invitation for an event
  I need to create an invite
  
  Scenario: Create a new invitation with default values
    When I create a new invitation with default values
    Then the invitation is saved
    And the invitation status is new
    
  Scenario: Create a new invitation with the automatic send option
    When I create a new invitation with the automatic send option
    Then the invitation is saved
    And the invitation is sent
    And the invitation status is unconfirmed