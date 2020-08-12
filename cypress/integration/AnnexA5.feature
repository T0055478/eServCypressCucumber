Feature: AnnexA5 Upload

  Background:
    Given I open the application
    And I enter "MxAdmin" in "#usernameInput"
    And I enter "1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

  Scenario: Basic file upload
    Then I see "e-Services Root Administrator Portal" in the title
    When I click the button containing "Data Management"
    And I click the button containing "Excel Import"
    Then I confirm that ".mx-name-text22" contains "Select upload details"
    And I select 'Annex A5' from 'select'
    And I upload an Annex A5
    And I click the button containing "Continue"
