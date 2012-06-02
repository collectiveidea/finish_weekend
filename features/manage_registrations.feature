@javascript
Feature: manage event registrations

  Background:
    Given the following events exist:
      | Name | Description | City    | State    | Country | Price | Capacity | Starts_at  | Ends_at    | slug | additional_info |
      | Test | Test Event  | Holland | Michigan | US      | 0.00  | 45       | 2012-01-01 | 2012-01-02 | test |                 |
    And the following registrations exist:
      | First Name | Last Name | Email                  | Shirt Size | Event      |
      | Tim        | Bugai     | tim@collectiveidea.com | L          | slug: test |
    
    And it is "December 30, 2011"
    And I am logged in as "admin/password"

  Scenario: registrant list
    When I follow "Test" within the event list
    And I follow "Registrations"
    Then I should see "Tim Bugai"
    And I should see "tim@collectiveidea.com"
    And I should see "L"
