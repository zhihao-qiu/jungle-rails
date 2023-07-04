describe('Product Detailed Page', () => {
  context('by clicking on a product', () => {

    beforeEach(() => {
      cy.visit('http://localhost:3000')
      .get('.products article')
      .first()
      .click()
    })

    it("should navigate to the product detail page", () => {
      cy.get(".product-detail").should("be.visible")
      // show the picture
      .get('img')
      .should("have.attr","src")
      .and("include","/uploads/product/image/2/plante_2.jpg")

      cy.get(".product-detail").should("be.visible")
      // contain the product name
      .should("contains.text","Scented Blade")
      // contain the description
      .should("contains.text","The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.")
      // contain the quantity
      .should("contains.text","18 in stock")
      // contain the price
      .should("contains.text","$24.99")
    });

  })
})
