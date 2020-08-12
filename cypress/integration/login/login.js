import { Given, And, Then} from "cypress-cucumber-preprocessor/steps";

const url = "http://localhost:8083/login.html?profile=Responsive";

Given(`I open the application`, () => {
  cy.visit(url);
});

Then (`I am logged in`, () => {
    cy.url().should('include', 'index')
})