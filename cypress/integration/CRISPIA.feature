Feature: CRISPIA Upload Test

  # Background:
  Background: Log in as Admin
    Given I open the application
    And I enter "MxAdmin" in "#usernameInput"
    And I enter "1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

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
    Then I confirm that "CRISPIAValidationText" contains "3 Annex A5 contract parts were not found in the file"
    Then I get 12 errors
    And I click the button containing "Cancel"

  # Background
  Background: Log in as User
    Given I open the application
    And I enter "DemoUser" in "#usernameInput"
    And I enter "Thales1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

  Scenario: Confirm CRISPIA details


 
    





    

