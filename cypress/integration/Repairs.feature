Feature: E2E Repairs Process Test

  Background: Log in as User
    Given I open the application
    # the following should be updated with the correct credentials:
    And I enter "DemoUser" in "#usernameInput"
    And I enter "Thales1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in
    And I wait for 500
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
    And I wait for 3000
    Then I confirm that the text contains "with an update"
    And I click the button containing "home page"
    And I click the button called "logOut"

  Scenario: User checks return request details and contracts
    Given I see the "portalHeader" page title
    And I click the button called "repairsPortal"
    And I click the button called "returnOverview"
    And I wait for 1000
    And I click the button called "actionButton1"
    And I wait for 1000
    And I see "Thales Radio Provision Contract" in the list
    And I see "Thales Radar Provision Contract" in the list
    And I see "Thales Satellite Provision Contract" in the list
    And I click the button called "logOut"

  Scenario: User checks open repair orders
    Given I see the "portalHeader" page title
    And I click the button called "repairsPortal"
    And I click the button called "repairsOverview"
    And I wait for 2000
    # should set to all repair orders:
    Then the datagrid has 3 rows
    And I click the button containing "View details"
    And I wait for 2000
    # should set to all repair orders + 1 (for search bar):
    Then the datagrid has 4 rows
    Then I click the button containing "Show ROC only"
    # update as required:
    Then I see "704410" in the datagrid
    Then I see "704411" in the datagrid
    Then I click the button containing "Show all"
    Then I see "704409" in the datagrid
    Then I see "704410" in the datagrid
    Then I see "704411" in the datagrid
    And I select "On time" from the RAG status dropdown
    Then I see "704410" in the datagrid
    And I select "Passed promise date" from the RAG status dropdown
    Then I see "704409" in the datagrid
    And I select "Passed request date" from the RAG status dropdown
    Then I see "704411" in the datagrid
    And I click the button containing "Reset filter"
    Then I see "704409" in the datagrid
    Then I see "704410" in the datagrid
    Then I see "704411" in the datagrid
    And I select "Request received" from the Status dropdown
    Then I see "704410" in the datagrid
    Then I see "704411" in the datagrid
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"

    # WIP - go through all statuses on the pie chart widget:
    
    # go through all statuses on the workflow widget:
    And I click the "Request_received" status on the workflow widget
    And I wait for 1000
    # should set to the number in that status + 1 (for search bar):
    Then the datagrid has 3 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Pending_return" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 2 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Item_received" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "In_survey" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Surveyed" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Customer_engagement" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Pending_repair" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "In_repair" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Repaired_pending_return" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "In_dispatch" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Dispatched" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Arrived" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Identified_BER" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Pending_BER_authorisation" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "BER_authorised" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Disposed" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    And I click the "Other" status on the workflow widget
    And I wait for 1000
    # update:
    Then the datagrid has 1 rows
    And I click the button containing "Repairs portal"
    And I click the button called "repairsOverview"
    