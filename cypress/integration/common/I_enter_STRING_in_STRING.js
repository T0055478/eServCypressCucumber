import { Given, Then, And } from "cypress-cucumber-preprocessor/steps";
import 'cypress-file-upload';

const url = "http://localhost:8083/login.html?profile=Responsive";

Given(`I open the application`, () => {
  cy.visit(url);
});

Then (`I am logged in`, () => {
    cy.url().should('include', 'index').as('loggedIn')
})

// Then(`I see {string} in the title`, title => {
//   cy.title().should("include", title);
// });

And (`I enter {string} in {string}`, (text, selectorName) => {
  cy.get (selectorName).type (text)
  });

And (`I click the button containing {string}`, (buttonString) => {
  cy.contains (buttonString).click()
})

And ('I select {string} from {string}', (value, selector) => {
  cy.get(selector).select(value)
})

Then (`I see {string} in the title`, title => {
  cy.wait (2000)
  //Added to manage delay in loading
  cy.get('.mx-name-title').contains(title);
});

Then ('I confirm that {string} contains {string}', (selector, text) => {
  cy.get(`.mx-name-${selector}`).contains(text)
})

Then ('I delete {string} from the datagrid', (title) => {
  cy.get(`[title=${title}]`).click()
  cy.contains ('Delete').click()
  cy.contains ('OK').click()
})

// And ('I upload a file from {string}', (filepath) => {
//   cy.get('[name=mxdocument]').attachFile(filepath)
//   cy.get('#file').upload({ fileContent, fileName, mimeType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', encoding: 'UTF - 8', }){ subjectType: 'input' }})
// })


And ('I upload an Annex A5', () => {
  cy.fixture('AnnexA5.xlsx', 'binary')
    .then(Cypress.Blob.binaryStringToBlob)
    .then(fileContent => {
      cy.get('input[type=file]').attachFile({
        fileContent,
        fileName: 'AnnexA5.xlsx',
        mimeType: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        encoding: 'utf8'
      })
})
})


