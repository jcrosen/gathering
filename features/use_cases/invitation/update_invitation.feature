# -*- coding: UTF-8 -*-

Feature: Update an invititation
  As a gathering organizer
  In order to communicate a change about an invitation
  I need to update the invitation
  
  Scenario: Update the email on an invitation that has already been sent
    When I update the email on an invitation that is not new
    Then the invitation is resent
    
  Scenario: Update the token on an invitation that has already been sent
    When I update the token on an invitation that is not new
    Then the invitation is resent