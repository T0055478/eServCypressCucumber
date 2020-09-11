 Feature: Equipment Group CRUD
 
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
    And I click the button containing "Continue"
    And I click the button containing "homepage"
    And I click the button called "logOut"

   Scenario: CRUD Equipment Groups
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Equipment group"
     And I click the button containing "New"
     And I enter "Group" in ".mx-name-textBox1"
     And I enter "Test Group" in ".mx-name-textBox2"
     And I toggle Active radio button
     And I click the button containing "Save"
     And I highlight "Group" in the datagrid
     And I click the button containing "Edit"
     And I enter "Second Test" in ".mx-name-textBox2"
     And I click the button containing "Save"

    Scenario: Add Equipment
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Equipment group"
     And I highlight "Group" in the datagrid
     And I click the button containing "Edit"
     And I click the button containing "Manage IMCs"
     Then I see "Add equipment" in the header
     And I highlight "O978" in the datagrid called "Available"
     And I click the button called "Add"
     And I click the button containing 'Close page'
     And I click the button containing 'Save'
     And I click the button containing "Edit"
     Then I see "Edit Master Equipment" in the header
     Then I see "O978" in the datagrid called "Selected"

    Scenario: Remove Equipment
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Equipment group"
     And I highlight "Group" in the datagrid
     And I click the button containing "Edit"
     And I click the button containing "Manage IMCs"
     Then I see "Add equipment" in the header
     And I highlight "O978" in the datagrid called "Current"
     And I click the button called "Remove"
     And I click the button containing 'Close page'
     And I click the button containing 'Save'
     Then the datagrid called 'Selected' has 0 rows

     Scenario: Data clean up
      Given I see "e-Services Root Administrator Portal" in the title
      When I click the button containing "Data Management"
      And I click the button containing "Equipment"
      Then I delete "O978" from the datagrid
      Then I delete "W333" from the datagrid
      And I click the button containing "Data Management"
      And I click the button containing "Equipment group"
      Then I delete "Group" from the datagrid
