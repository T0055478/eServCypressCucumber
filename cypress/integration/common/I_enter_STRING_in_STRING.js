import { Given, Then, And } from "cypress-cucumber-preprocessor/steps";
import 'cypress-file-upload';

const url = "http://localhost:8083/login.html?profile=Responsive";

Given(`I open the application`, () => {
  cy.visit(url);
});

Then (`I am logged in`, () => {
    cy.url().should('include', 'index').as('loggedIn')
})

//Generic navigation

And (`I enter {string} in {string}`, (text, selectorName) => {
  cy.get (selectorName).type (text)
  });

And (`I click the button containing {string}`, (buttonString) => {
  cy.contains (buttonString).click({force:true})
})

And (`I click the button called {string}`, (selector) => {
  cy.wait (200)
  cy.get(`.mx-name-${selector}`).click()
})


And ('I select {string} from {string}', (value, selector) => {
  cy.get(selector).select(value)
})

//Generic tests

// Then (`I see {string} in the title`, title => {
//   cy.get('.mx-name-title').should("contain",title);
// });

Given (`I see {string} in the title`, title => {
  cy.wait (2000)
  cy.get('.mx-name-title').should("contain",title);
  cy.wait (2000)
});

Then ('I confirm that {string} contains {string}', (selector, text) => {
  cy.get(`.mx-name-${selector}`).contains(text)
})

// Datagrids

Then ('I delete {string} from the datagrid', (title) => {
  cy.get(`[title=${title}]`).first().click()
  cy.contains ('Delete').click()
  cy.contains ('OK').click()
  cy.wait (500)
})

// Excel uploads

And ('I upload a {string} excel file', fileName => {
  cy.fixture(`${fileName}.xlsx`, 'binary')
    .then(Cypress.Blob.binaryStringToBlob)
    .then(fileContent => {
      cy.get('input[type=file]').attachFile({
        fileContent,
        fileName: `${fileName}.xlsx`,
        mimeType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        encoding: 'utf8'
      })
})
})


Then ('I see error {string}', (title) => {
  cy.get(`[title=${title}]`).click()
})

Then ('I get {int} errors', (int) => {
  cy.get('.mx-name-Errors tbody tr').should('have.length', int)
})


Then ('I get {int} Dues in', (int) => {
  cy.get('.mx-name-DuesInTracker tbody tr').should('have.length', int)
})
