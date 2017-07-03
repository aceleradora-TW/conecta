var expect = require('chai').expect;
var emailValidator = require('../../public/email_validator');

describe('EmailValidator', function() {
  describe('#isValidEmail', function() {
    it('retorna true quando email é válido', function() {
      expect(emailValidator.isValidEmail("aceleradora@gmail.com")).to.equal(true);
      expect(emailValidator.isValidEmail("aceleradora@gmail.com.br")).to.equal(true);
      expect(emailValidator.isValidEmail("aceleradora11@pucrs.br")).to.equal(true);
    });

    it('retorna falso quando email for inválido', function() {
      expect(emailValidator.isValidEmail("aceleradoragmail.com")).to.equal(false);
      expect(emailValidator.isValidEmail("aceleradora@.com")).to.equal(false);
    });
  });
});
