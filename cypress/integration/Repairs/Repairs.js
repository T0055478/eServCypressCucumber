import { Given, Then, And } from "cypress-cucumber-preprocessor/steps";
import 'cypress-file-upload';

const url = "http://localhost:8083/login.html?profile=Responsive";

// Reference selector Contract specific click
And ('I click the Contracts drop-down and select {string}', (value) => {
    cy.wait(2000)
    cy.get(`#mxui_widget_ReferenceSelector_0_input`).select(value)
})

// Reference selector Primary Fault Description specific click
And ('I click the Primary Fault Description drop-down and select {string}', (value) => {
    cy.wait(500)
    cy.get('#mxui_widget_ReferenceSelector_4_input').select(value)
})

// Reference selector Reason For Return specific click
And ('I click the Reason For Return drop-down and select {string}', (value) => {
    cy.wait(500)
    cy.get('#mxui_widget_ReferenceSelector_5_input').select(value)
})