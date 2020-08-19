import { Given, Then, And } from "cypress-cucumber-preprocessor/steps";
import 'cypress-file-upload';

const url = "http://localhost:8083/login.html?profile=Responsive";

// Contract part tabbed data grid specific click
And ('I click the first row in the Contract Parts A5 datagrid', () => {
    cy.wait (200)
    cy.get(`.mx-name-index-0 > .mx-name-column16`).first().click()
    cy.wait (500)
  })