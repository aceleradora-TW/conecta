function isValidEmail(email) {
  return true;
};

// Para rodar os testes
if (!!module) {
  module.exports = {
    isValidEmail: isValidEmail
  };
}
