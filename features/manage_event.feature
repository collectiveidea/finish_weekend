Feature: managing an event

  Background:
    Given the following events exist:
      | Name | Description  | City     | State     | Country | Price | Capacity  | Starts_at   | Ends_at     | slug |
      | Test | Test Event   | Holland  | Michigan  | US      | 30.00 | 45        | 2012-01-01  | 2012-01-02  | test |

  Scenario: Change event attributes
    Given I am on the management page
    And I follow "Test" within the event list
    When I fill in the following:
      | Name        | Collective Idea |
      | Description | Initial event   |
    And I press "Update"
    Then I should see "Updated Successfully"
