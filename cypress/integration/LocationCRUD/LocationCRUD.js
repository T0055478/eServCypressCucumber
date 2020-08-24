And ('I toggle Active radio button', () => {
    cy.get(`[value="false"]`).first().click()
  })