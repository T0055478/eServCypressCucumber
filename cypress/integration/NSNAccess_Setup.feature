Feature: E2E NSN Access Configuration Test 1/3

  # Background:
  Background: Log in as Admin
    Given I open the application
    And I enter "MxAdmin" in "#usernameInput"
    And I enter "1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

  Scenario: Basic Annex A5 file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'Annex A5' from 'select'
    And I upload a "AnnexA5" excel file
    And I click the button called "uploadValidation"
    And I click the button called "continueValidation"
    And I click the button containing "homepage"

  Scenario: Basic CRISP file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'CRISP Upload' from 'select'
    And I upload a "CRISPDuesIn_NSNAccess" excel file
    And I click the button called "uploadValidation"
    And I click the button called "continueValidation"
    And I click the button containing "homepage"

  Scenario: Confirm all Dues In Tracker orders 
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Dues in tracker"
    And I see "123456" in the datagrid
    And I see "999999" in the datagrid
    And I see "616616" in the datagrid
    And I see "666666" in the datagrid

  Scenario: Set Contract to NSN Configurable
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Contracts"
    And I highlight "123456789" in the datagrid
    And I click the button containing "Edit"
    And I toggle "NSNConfigurable" radio button to true
    And I click the button containing "Save"

  Scenario: Set NSN access for User
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "User Management"
    And I highlight "DemoUser" in the datagrid
    And I click the button containing "Configure NSNs"
    # The following row assume same data as in local/dev, update as required:
    Then the datagrid called "NSNAccessSearch" has 8 rows
    Then the datagrid called "accessibleNSNs" has 0 rows
    And I click the button containing "Add all"
    And I highlight "2510-12-359-4680" in the datagrid called "accessibleNSNs"
    And I click the button called "removeSingle"
    Then the datagrid called "accessibleNSNs" has 7 rows
    And I click the button called "logOut"
    