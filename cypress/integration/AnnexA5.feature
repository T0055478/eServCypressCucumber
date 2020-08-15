Feature: AnnexA5 Upload

  Background:
    Given I open the application
    And I enter "MxAdmin" in "#usernameInput"
    And I enter "1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

  Scenario: Basic file upload
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that "text22" contains "Select upload details"
    And I select 'Annex A5' from 'select'
    And I upload an Annex A5
    And I click the button containing "Continue"
    Then I confirm that "AnnexA5ValidationText" contains "0 errors"
    Then I confirm that "AnnexA5ValidationText" contains "5 new parts created"
    Then I confirm that "AnnexA5ValidationText" contains "2 new equipment created"
    And I click the button containing "Continue"
    And I click the button containing "homepage"
  
  Scenario: Location/Equipment/Contract Part management and clean up
    Given I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Equipment"
    Then I delete "O978" from the datagrid
    Then I delete "W333" from the datagrid
    And I click the button containing "Data Management"
    And I click the button containing "Parts"
    And I click the button containing "Contract Parts (Annex A5)"
    And I click the button containing "Delete all"
 
    





    

