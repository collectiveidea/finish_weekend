Feature: Registration
  Background:
    Given the following event exists:
      | name   | price |
      | Boston | 30.00 |

  Scenario: Successful registration
    Given I am on the homepage
    When I follow "Register"
    And I fill in the following:
      | First Name         | Steve                   |
      | Last Name          | Richert                 |
      | Email              | steve.richert@gmail.com |
      | Credit Card Number | 4242424242424242        |
      | CVC                | 123                     |
    And I press "Register"
    Then I should see "Thank you"
    And I should be on the "Boston" event page
    And I should see "Steve Richert" within the "Attendees" list
    And "Steve Richert" should be $30 poorer
    And Finish Weekend should be $30 richer
