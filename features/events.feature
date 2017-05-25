Feature: events
  Background:
    Given the following events exist:
      | Name   | Description  | City    | State    | Country | Price | Capacity | Starts_at  | Ends_at    | slug   | additional_info |
      | Future | Future Event | Holland | Michigan | US      | 30.00 | 45       | 2012-08-01 | 2012-08-02 | future |                 |
      | Test   | Test Event   | Holland | Michigan | US      | 30.00 | 45       | 2012-01-01 | 2012-01-02 | test   |                 |
      | Past   | Past Event   | Holland | Michigan | US      | 30.00 | 45       | 2011-11-01 | 2011-11-02 | past   |                 |

  Scenario: next upcoming event is on the home page
    Given it is "December 30, 2011"
    And I am on the homepage
    Then I should see "Finish Weekend Test"

  Scenario: current event is on the home page
    Given it is "January 1, 2012"
    And I am on the homepage
    Then I should see "Finish Weekend Test"

  Scenario: last event scheduled is still on the home page
    Given it is "December 30, 2012"
    And I am on the homepage
    Then I should not see "Finish Weekend Future"
    And I should see "Stay Tuned"

  Scenario: list of events
    Given it is "January 1, 2012"
    And I am on the homepage
    And I follow "Events" within the navigation menu
    Then I should see "Future" within the upcoming events list
    And I should see "Test" within the current events list
    And I should see "Past" within the previous events list
