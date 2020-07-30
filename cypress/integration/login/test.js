import { Given, And, Then} from "cypress-cucumber-preprocessor/steps";

const url = "http://localhost:8083/login.html?profile=Responsive";

Given(`I open the application`, () => {
  cy.visit(url);
});

And (`I enter my details`, () => {
    cy.get ('#usernameInput').type ('DemoUser')
    cy.get ('#passwordInput').type ('Thales1')
    });

And (`I sign in`, () => {
    cy.contains ('Log In').click()
})

Then (`I am logged in`, () => {
    cy.url().should('include', 'index')
})