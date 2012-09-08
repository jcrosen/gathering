# -*- coding: UTF-8 -*-

Feature: Update an invititation
  As a gathering organizer
  In order to invite a person to an event
  I need to send the invitation
    
  Scenario: Send an invitation
    When I send an invitation
    Then the invitation is sent
    And the invitation status is unconfirmed