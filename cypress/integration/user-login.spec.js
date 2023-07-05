describe('User Signup & Login', () => {
  context('signup and login sequence', () => {

    beforeEach(() => {
      cy.visit('http://localhost:3000');
    });

    it("should signup and navigate to homepage", () => {
      cy.contains('Signup')
        .click();

      cy.get('input[name="user[firstname]"]')
        .type('Jane');

      cy.get('input[name="user[lastname]"]')
        .type('Doe');

      cy.get('input[name="user[email]"]')
        .type('jane_doe@mail.ca');

      cy.get('input[name="user[password]"]')
        .type('password');

      cy.get('input[name="user[password_confirmation]"]')
        .type('password');

      cy.get('input[name="commit"]')
        .click();

      cy.contains('#navbarSupportedContent', 'Jane');

      cy.contains('#navbarSupportedContent', 'Logout');

    });

  });

  context('login sequence only', () => {

    it("should login and navigate to homepage", () => {
      cy.contains('Login')
        .click();

      cy.get('input[name="email"]')
        .type('john_doe@mail.ca');

      cy.get('input[name="password"]')
        .type('password');

      cy.get('input[name="commit"]')
        .click();

      cy.visit('http://localhost:3000')
        .get('.button_to')
        .first()
        .submit();

      cy.contains('#navbarSupportedContent', 'John');

      cy.contains('#navbarSupportedContent', 'Logout');
    });

  });
});
