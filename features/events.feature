Feature: events

  Background:
    Given the following events exist:
      | Name | Description | City    | State    | Country | Price | Capacity | Starts_at  | Ends_at    | slug | additional_info |
      | Test | Test Event  | Holland | Michigan | US      | 30.00 | 45       | 2012-01-01 | 2012-01-02 | test |                 |
      | Past | Test Event  | Holland | Michigan | US      | 30.00 | 45       | 2011-11-01 | 2011-11-02 | past |                 |
    And it is "December 30, 2011"

  Scenario: latest event is on the home page
    Given I am on the homepage
    Then I should see "Finish Weekend Test"

  Scenario: list of events
    Given I am on the homepage
    And I follow "Events" within the navigation menu
    Then I should see "Test" within the upcoming events list
    And I should see "Past" within the previous events list
