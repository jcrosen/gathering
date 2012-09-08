# -*- coding: UTF-8 -*-

Feature: Confirm an inviataion
  As a person invited to an event
  In order to communicate my attendance (or lack thereof)
  I need to confirm the invataion
  
  Scenario: Confirm an invitation as attending
    When I confirm an invitation as attending
    Then the invitation status is attending
    
  Scenario: Confirm an invitation with an incorrect token
    When I confirm an invitation with the incorrect token value
    Then I receive an invitation error
    And the error references an invalid token
    
  Scenario: Reconfirm an invitation with a new status of not attending
    When I confirm an invitation as attending
    And I reconfirm an invitation as not attending
    Then the invitation status is not attending