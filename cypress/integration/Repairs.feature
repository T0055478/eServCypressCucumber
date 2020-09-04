Feature: E2E Repairs Process Test

  Background: Log in as User
    Given I open the application
    # the following should be updated with the correct credentials:
    And I enter "DemoUser" in "#usernameInput"
    And I enter "Thales1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in
    And I click the button called "acceptDisclaimer"

  Scenario: User creates a return request
    Given I see the "portalHeader" page title
    And I click the button called "repairsPortal"
    And I click the button called "newReturn"
    And I click the Contracts drop-down and select "Thales Radio Provision Contract"
    And I click the Primary Fault Description drop-down and select "Damaged"
    And I click the Reason For Return drop-down and select "Repair"
    And I click the button called "addPart"
    And I click the button called "nonContractPart"
    And I enter "123456789" in the "partNumber" field
    And I enter "123456789" in the "customerPartNumber" field
    And I enter "123456789" in the "serialNo" field
    And I click the button called "addReturnPart" 
    And I click the button called "continueReturn"
    And I click the button called "submitReturn"
    And I wait for 4000
    Then I confirm that the text contains "with an update"
    And I click the button containing "home page"

  Scenario: User checks return request details
    Given I see the "portalHeader" page title
    And I click the button called "repairsPortal"
    And I click the button called "returnOverview"
    And I click the button called "filterReturnSearch"
    # the following number should be updated based on the return request ID:
    And I enter "10000187" in the "searchReturn" field
    And I click the button called "viewRequest"
    Then I confirm that "wizardStep2" contains "Step 2 - Summary"
    And I click the button containing "Back"