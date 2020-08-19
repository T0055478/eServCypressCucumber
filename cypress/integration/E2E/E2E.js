  import { Given } from "cypress-cucumber-preprocessor"

  Given(`I click the button in the div`, () => {
    cy.contains('Button');
  });