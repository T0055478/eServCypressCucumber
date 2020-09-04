Feature: E2E CRISPIA Upload Test

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
    And I click the button called "logOut"

  Scenario: Basic CRISPIA file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'CRISP IA' from 'select'
    And I upload a "CRISPIA" excel file
    And I click the button called "uploadValidation"
    Then I confirm that "CRISPIAValidationText" contains "0 errors"
    Then I confirm that "CRISPIAValidationText" contains "1 change(s) have been processed"
    And I click the button called "continueValidation"
    And I click the button containing "homepage"

  Scenario: Error CRISPIA file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'CRISP IA' from 'select'
    And I upload a "CRISPIA_ErrorTest" excel file
    And I click the button containing "Continue"
    Then I confirm that "CRISPIAValidationText" contains "12 errors"
    Then I confirm that "CRISPIAValidationText" contains "0 change(s) have been processed"
    Then I confirm that "CRISPIAValidationText" contains "5 Annex A5 contract parts were not found in the file"
    Then I get 12 errors
    And I click the button containing "Cancel"

  Scenario: Confirm CRISPIA data upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Parts"
    And I click the tab called "annexA5Tab"
    Then I click the button called "searchButton6"
    And I enter "200015758" in the widget element with ID "SearchInput_3"
    And I click the widget element with ID "Button_6"
    And I click the first row in the Contract Parts A5 datagrid
    And I click the button called "actionButton18"
    Then I confirm that "accountingClass" contains "C"
    Then I confirm that "stockA1" contains "0"
    Then I confirm that "stockE0" contains "0"
    Then I confirm that "FDR" contains "0.05"
    Then I confirm that "hazardCategory" contains "0"
    Then I confirm that "lastActivity" contains "2017"
    Then I confirm that "price" contains "£541.78"
    Then I confirm that "primaryQty" contains "0"
    Then I confirm that "rrrc" contains "62"
    Then I confirm that "securityClass" contains "N"
    Then I confirm that "shelfLife" contains "0"
    Then I confirm that "TLS" contains "1"
    Then I confirm that "years" contains "1"
    Then I confirm that "oem" contains "OEM 434/4/95880/004"
    And I click the button containing "Cancel"
    And I click the button called "logOut"
    
  Scenario: Data clean up
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Equipment"
    Then I delete "O978" from the datagrid
    Then I delete "W333" from the datagrid
    And I click the button containing "Data Management"
    And I click the button containing "Parts"
    And I click the button containing "Contract Parts (Annex A5)"
    And I click the button containing "Delete all"