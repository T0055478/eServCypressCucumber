Feature: E2E NSN Access Configuration Test 3/3

  # Background:
  Background: Log in as Admin
    Given I open the application
    And I enter "MxAdmin" in "#usernameInput"
    And I enter "1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

  Scenario: Data clean up
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Equipment"
    Then I delete "O978" from the datagrid
    Then I delete "W333" from the datagrid
    And I click the button containing "Administrator Portal"
    And I click the button containing "Data Management"
    And I click the button containing "Parts"
    And I click the button containing "Contract Parts (Annex A5)"
    And I click the button containing "Delete all"
    And I click the button containing "Administrator Portal"
    And I click the button containing "User Management"
    And I highlight "DemoUser" in the datagrid
    And I click the button containing "Configure NSNs"
    And I click the button containing "Remove all"
    And I click the button containing "Administrator Portal"
    When I click the button containing "Contracts"
    And I see "Thales Radio Provision Contract" in the datagrid
    And I highlight "Thales Radio Provision Contract" in the datagrid
    And I click the button containing "Edit Contract"
    And I toggle "NSNConfigurable" radio button to true
    And I click the button called "logOut"
    # No existing CRISP order delete functionality


    