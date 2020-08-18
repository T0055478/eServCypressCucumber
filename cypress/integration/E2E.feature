Feature: E2E Upload Tests

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
    And I click the button containing "Continue"
    Then I confirm that "AnnexA5ValidationText" contains "0 errors"
    Then I confirm that "AnnexA5ValidationText" contains "5 new parts created"
    Then I confirm that "AnnexA5ValidationText" contains "2 new equipment created"
    And I click the button containing "Continue"
    And I click the button containing "homepage"

  Scenario: Error Annex A5 file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'Annex A5' from 'select'
    And I upload a "AnnexA5_ErrorTest" excel file
    And I click the button containing "Continue"
    Then I get 9 errors

  Scenario: Deactivation Annex A5 file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'Annex A5' from 'select'
    And I upload a "AnnexA5_Deactivation" excel file
    And I click the button containing "Continue"
    Then I confirm that "AnnexA5ValidationText" contains "5 parts made inactive"
    Then I confirm that "AnnexA5ValidationText" contains "2 equipment made inactive"
    And I click the button containing "Continue"
    And I click the button containing "homepage"

   Scenario: CRUD Locations
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Location"
     And I click the button containing "New"
     And I enter "K1000" in ".mx-name-textBox1"
     And I enter "Test Location" in ".mx-name-textBox2"
     And I click the button containing "Save"
     And I click the button containing "New"
     And I enter "B1000" in ".mx-name-textBox1"
     And I enter "Test Location" in ".mx-name-textBox2"
     And I click the button containing "Save"
     And I click the button containing "B1000"
     And I click the button containing "Edit"
     And I enter "Second Test" in ".mx-name-textBox2"
     And I click the button containing "Save"
  
   Scenario: CRUD Equipment
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Equipment"
     And I click the button containing "New"
     And I enter "M1234" in ".mx-name-textBox1"
     And I enter "Test Equipment" in ".mx-name-textBox2"
     And I click the button containing "Save"
     And I click the button containing "M1234"
     And I click the button containing "Edit"
     And I enter "Second Test" in ".mx-name-textBox2"
     And I click the button containing "Save"
     Then I delete "M1234" from the datagrid

  Scenario: Basic CRISP Dues In file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'CRISP Upload' from 'select'
    And I upload a "CRISPDuesIn" excel file
    And I click the button containing "Continue"
    Then I confirm that "CRISPDuesInValidationText" contains "0 errors"
    Then I confirm that "CRISPDuesInValidationText" contains "3 new orders created"
    And I click the button containing "Continue"
    And I click the button called "logOut"
  
  Scenario: Close order CRISP Dues In file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'CRISP Upload' from 'select'
    And I upload a "CRISPDuesIn" excel file
    And I click the button containing "Continue"
    Then I confirm that "CRISPDuesInValidationText" contains "0 errors"
    Then I confirm that "CRISPDuesInValidationText" contains "1 orders closed"
    And I click the button containing "Continue"
    And I click the button called "logOut"
  
  Scenario: CRISP Dues In error file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'CRISP Upload' from 'select'
    And I upload a "CRISPDuesIn" excel file
    And I click the button containing "Continue"
    Then I confirm that "CRISPDuesInValidationText" contains "24 errors"
    And I click the button containing "Continue"
    And I click the button called "logOut"

    And I enter "DemoUser" in "#usernameInput"
    And I enter "Thales1" in "#passwordInput"
    And I click the button containing "Log In"
    And I click the button containing "Dues In"
    And I click the button containing "Dues in tracker"
    Then I get 3 Dues in
    And  I click the button containing "Delete all"


  Scenario: Location/Equipment/Contract Part management and clean up
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Equipment"
    Then I delete "O978" from the datagrid
    Then I delete "W333" from the datagrid
    Then I delete "A123" from the datagrid
    Then I delete "B234" from the datagrid
    And I click the button containing "Data Management"
    And I click the button containing "Parts"
    And I click the button containing "Contract Parts (Annex A5)"
    And I click the button containing "Delete all"
    And I click the button containing "Data Management"
    And I click the button containing "Location"
    Then I delete "K1000" from the datagrid
    Then I delete "B1000" from the datagrid
 
    





    

