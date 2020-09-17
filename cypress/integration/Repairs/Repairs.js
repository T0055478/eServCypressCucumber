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

// Pie chart on Repairs overview click
And ('I click the RAG Status Chart', () => {
    cy.wait(200)
    cy.get('#canvasid_ChartJS_widgets_PieChart_widget_PieChart_1').click()
    // DOES NOT WORK AS INTENEDED - NEED TO GET SUB PIES
})

// Status widget on Repairs overview click, string must be formatted with XX_XX if space
And ('I click the {string} status on the workflow widget', (value) => {
    cy.wait(200)
    cy.get(`.${value} > .parentCircle > .statusCircle > .statusNumber`).click()
})

// Drop down for RAG status on Repair details
And ('I select {string} from the RAG status dropdown', (value) => {
    cy.wait(200)
    cy.get('.mx-name-dropDown1 select').select(value)
    })

// Drop down for RAG status on Repair details
And ('I select {string} from the Status dropdown', (value) => {
    cy.wait(200)
    cy.get('.mx-name-dropDown2 select').select(value)
    })
