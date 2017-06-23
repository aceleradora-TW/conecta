var expect = require('chai').expect;
var emailValidator = require('../../public/js/email_validator');

describe('EmailValidator', function() {
  describe('#isValidEmail', function() {
    it('retorna true quando email é válido', function() {
      expect(emailValidator.isValidEmail("aceleradora@gmail.com")).to.equal(true);
    });
  });
});
