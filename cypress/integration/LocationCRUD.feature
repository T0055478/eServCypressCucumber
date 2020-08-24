 Feature: Location CRUD
 
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
    And I click the button called "logOut"

   Scenario: CRUD Locations
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Location"
     And I click the button containing "New"
     And I enter "B1000" in ".mx-name-textBox1"
     And I enter "Test Location" in ".mx-name-textBox2"
     And I click the button containing "Save"
     Then I see "B1000" in the datagrid
     And I highlight "B1000" in the datagrid
     And I click the button containing "Edit"
     And I enter "Second Test" in ".mx-name-textBox2"
     And I toggle Active radio button
     And I click the button containing "Save"
     And I click the button called "logOut"
    
   Scenario: Add Contract Parts
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Location"
     And I highlight "B1000" in the datagrid
     And I click the button containing "Edit"
     And I click the button containing "Manage NSNs"
     Then I see "Add contract part" in the header
     And I highlight "200025602" in the datagrid called "Available"
     And I click the button called "Add"
     And I click the button containing 'Close page'
     And I click the button containing 'Save'
     And I click the button containing "Edit"
     Then I see "Edit Location" in the header
     Then I see "200025602" in the datagrid
    
    Scenario: Remove Contract Parts
     Given I see "e-Services Root Administrator Portal" in the title
     When I click the button containing "Data Management"
     And I click the button containing "Location"
     And I highlight "B1000" in the datagrid
     And I click the button containing "Edit"
     And I click the button containing "Manage NSNs"
     Then I see "Add contract part" in the header
     And I highlight "200025602" in the datagrid called 'Current'
     And I click the button containing "Remove"
     And I click the button containing "Close page"
     Then the datagrid called 'ContractPartGrid' has 0 rows

     Scenario: Data clean up
      Given I see "e-Services Root Administrator Portal" in the title
      When I click the button containing "Data Management"
      And I click the button containing "Location"
      Then I delete "B1000" from the datagrid

