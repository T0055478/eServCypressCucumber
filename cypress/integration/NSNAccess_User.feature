Feature: E2E NSN Access Configuration Test 2/3

  # Background:
  Background: Log in as User
    Given I open the application
    And I enter "DemoUser" in "#usernameInput"
    And I enter "Thales1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in
    And I click the button called "acceptDisclaimer"

  Scenario: Confirm restricted access
    Given I see the "portalHeader" page title
    And I click the button called "duesInPortal"
    And I click the button called "NSNAccess"
    Then the datagrid called "NSNAccessSearch" has 0 rows
    Then the datagrid called "accessibleNSNs" has 7 rows
    And I click the button called "filterAccessible" 
    And I enter "NCAGE" in the "searchField6" field
    And I highlight "123456789" in the datagrid called "accessibleNSNs"
    And I click the button called "removeSingle"

  Scenario: Restricted access on Dues In Tracker for User 
    Given I see the "portalHeader" page title
    And I click the button called "duesInPortal"
    And I click the button called "duesInTracker"
    # These orders correspond to the Contract NSN access, only _NoContractPart shown, update as required:
    And I see "123456" in the datagrid
    And I see "999999" in the datagrid
    And I click the button called "logOut"




    