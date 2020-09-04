# WIP! This will not run

Feature: E2E Repairs Order process

 # Background:
  Background: Log in as Administrator
    Given I open the application
    # the following should be updated with the correct credentials:
    And I enter "MxAdmin" in "#usernameInput"
    And I enter "1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

  Scenario: Administrator checks contract part details

    # Given that I am logged into the Administrator e-Services portal
    # When I navigate to Data Management > Parts 
    # Then I see all the expected parts and part details
    # And I navigate to Contract Parts
    # Then I see all the expected contract parts and contract part details

    Given I see "e-Services Root Administrator Portal" in the title
    And I click the button containing "Data Management"
    And I click the button containing "Parts"
    # the following should be updated with the correct value:
    Then the datagrid has 966 rows
    And I click the tab called "contractParts"
    # the following should be updated with the correct value:
    Then the datagrid has 105 rows
    And I click the button called "logOut"

  # Background:
  Background: Log in as User
    Given I open the application
    # the following should be updated with the correct credentials:
    And I enter "DemoUser" in "#usernameInput"
    And I enter "Thales1" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in
    And I click the button called "acceptDisclaimer"

  Scenario: User creates a return request
   
    # Given that I am logged into the e-Services Portal
    # And I create a new return request
    # When I submit a completed return request
    # Then I should receive a confirmation message that the request was submitted
    # (cannot be auto-tested) And I receive an email with the return request details

    Given I see the "repairPortalTitle" page title
    And I click the button called "repairsPortal"
    And I click the button called "newReturn"
    And I click the button called "contract"
    And I select the item called "IRIS Core Services"
    And I click the button called "primaryDescription"
    And I select the item called "Damaged"
    And I seelct the button called "returnReason"
    And I select the item called "REPAIR"
    And I select the button called "addPart"
    And I click the button called "searchContractPart"
    And I select the first item in the list 
    And I enter "123456789" in "serialNo"
    And I click the button called "addReturnPart" 
    And I click the button called "continueReturn"
    And I click the button called "submitReturn"
    Then I confirm that "returnValidation" contains "submitted successfully"
    And I click the button containing "homepage"
    And I click the button called "logOut"
  
  Scenario: User checks return request details

    # Given that I am logged into the e-Services Portal
    # And I navigate to the Returns Overview page
    # When I click on my Submitted return request
    # Then I should see a summary of the request details

    Given I see the "repairPortalTitle" page title
    And I click the button called "repairsPortal"
    And I click the button called "returnOverview"
    And I click the button called "filterReturnSearch"
    # the following number should be updated based on the return request ID:
    And I enter "10000078" in "searchReturn"
    And I click the button called "viewRequest"
    Then I confirm that "wizardStep2" contains "Step 2 - Summary"
    And I click the button containing "Back"
    And I click the button called "logOut"
    
  Scenario: User checks open repair orders

    # Given that I am logged into the e-Services Portal
    # And I navigate to the Repairs Overview page
    # When I click on the ROC Only button
    # Then I see an updated overview of my Repair Orders showing only orders that have ROC numbers
    # When I click the View details button
    # Then I see the repair details for all my Repair Orders
    # When I click a Status on the RAG Status Pie Chart on the overview page
    # Then I see only repair orders with that status in the datagrid
    # When I click a Repair Order Status on the repair order status widget 
    # Then I see only repair orders with that status in the datagrid

    Given I see the "repairPortalTitle" page title
    And I click the button called "repairsPortal"
    And I click the button called "repairsOverview"
    And I click the button called "showROCOnly"
    Then the RAG Status Chart and Repair Order Status widget are updated
    And I click the button called "showAll"
    Then the RAG Status Chart and Repair Order Status widget are updated
    And I click the button called "viewDetails"
    Then I confirm that "repairDetails" contains "Repair details" 
    And I click the button called "ROCOnly" 
    And I click the button called "repairsPortalBreadcrumb"
    And I click the button called "repairsOverview"
    And I click on the RAG Status Chart 
    Then I confirm that the RAG status in the datagrid matches what I clicked
    And I click the button called "repairsPortalBreadcrumb"
    And I click the button called "repairsOverview"
    And I click a status in the Repair Order Status widget
    Then I confirm that the Order Status in the datagrid matches what I clicked
    And I click the button called "logOut"

  # Background:
  Background: Log in as Administrator
    Given I open the application
    # the following should be updated with the correct credentials:
    And I enter "UATusername" in "#usernameInput"
    And I enter "UATpassword" in "#passwordInput"
    And I click the button containing "Log In"
    Then I am logged in

  Scenario: Admin check return request submitted

    # Given that I am logged into the Administrator e-Services portal
    # When I navigate to the logs
    # Then I see the JSON outbound message for the return request and the processed email

    Given I see "e-Services Root Administrator Portal" in the title
    And I click the button containing "Logging"
    And I highlight "JSON message outbound" in the datagrid
    And I click the button containing "View details"
    Then I confirm that the JSON details match the raised repair request
    And I click the button containing "Close"
    And I highlight "Processed 1 emails." in the datagrid
    And I click the button containing "View details"
    Then I confirm that the email was processed
    And I click the button containing "Close"
    And I click the button called "logOut"






