describe('Add To Cart', () => {
  context('by clicking add to cart', () => {

    beforeEach(() => {
        cy.visit('http://localhost:3000')

        cy.contains('Login')
          .click()

        cy.get('input[name="email"]')
          .type('john_doe@mail.ca')

        cy.get('input[name="password"]')
          .type('password')

        cy.get('input[name="commit"]')
          .click()

        cy.visit('http://localhost:3000')
          .get('.button_to')
          .first()
          .submit();
    });

    it("should increases by one in the cart on the homepage", () => {
      cy.get("#navbarSupportedContent")
        .should("contains.text", "My Cart (1)");
    });

    it("should display one product in the cart page", () => {
      cy.contains("My Cart")
        .click()
      cy.get("tbody").should("be.visible");

    });

  });
});
