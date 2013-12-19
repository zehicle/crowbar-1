Feature: Network Maps
  As an operator, who need to figure out networking
  want to figure out which node are on which networks

  Scenario: Network Map UI 
    When I go to the "network/map" page
    Then I should see a heading {bdd:crowbar.i18n.barclamp_network.networks.map.title}
      And there should be no translation errors

  Scenario: Network Map Drill Node
    Given I am on the "network/map" page
    When I click on the "admin" link
    Then I should see heading "admin"
      And there should be no translation errors

  Scenario: Network Map Drill Net
    Given I am on the "network/map" page
    When I click on the "admin" link
    Then I should see a heading "admin"
      And there should be no translation errors
