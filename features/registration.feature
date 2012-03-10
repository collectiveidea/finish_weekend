Feature: Registration
  Background:
    Given the following event exists:
      | name   | price |
      | Boston | 30.00 |

  @javascript @payment
  Scenario: Successful registration
    Given I am on the homepage
    When I follow "Register"
    And I fill in the following:
      | First Name         | Steve                   |
      | Last Name          | Richert                 |
      | Email              | steve.richert@gmail.com |
      | Credit Card Number | 4242424242424242        |
      | CVC                | 123                     |
    And I select "01 - January" from "Expiration Month"
    And I select "2020" from "Expiration Year"
    And I press "Register"
    Then I should see "Thank you"
    And I should be on the "Boston" event page
    And I should see "Steve Richert" within the "Attendees" list
    And $30.00 should have been charged
