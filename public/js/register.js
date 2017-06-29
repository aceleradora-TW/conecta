function openTab(buttonId, tabClass, tabLinkClass, tabId) {

  var i, tabcontent, tablinks;

  tabcontent = document.getElementsByClassName(tabClass);
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].classList.add("u-displayNone");
    tabcontent[i].classList.remove("active");
  }

  tablinks = document.getElementsByClassName(tabLinkClass);
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].classList.remove("u-colorBackgroundDarkerBlue");
  }

  document.getElementById(tabId).classList.remove("u-displayNone");
  document.getElementById(tabId).classList.add("active");
  document.getElementById(buttonId).classList.add("u-colorBackgroundDarkerBlue");
}

function changeRegisterTab(buttonId, tabId){
  if(validateFieldsActiveTab()){
    openTab(buttonId,"BoxRegisterBody","ButtonChangeTab",tabId);
  }
}
function getActiveTab(){
  return document.querySelector("div.BoxRegisterBody.active");
}

function validateFieldsOntab(tabElement){
  var valid = true;
  var requiredElements = tabElement.querySelectorAll(".required");
  resetInvalidFields(requiredElements);
  requiredElements.forEach(function validateRequiredElements(element) {
    if (!validateField(element)) {
      valid = false;
    }
  })
  requiredCheckBoxes = tabElement.querySelectorAll(".requiredOne");
  requiredCheckBoxes.forEach(function setOnChangeEventOne(checkboxGroup) {
    if (!validateCheckBoxes(checkboxGroup)){
      valid = false;
    }
  })
  return valid;
}

function validateFieldsActiveTab(){
  var tabElement = getActiveTab()
  return validateFieldsOntab(tabElement);
}

function resetInvalidFields(fields) {
  fields.forEach(function cleanInvalid(element) {
    resetInvalidField(element);
  })
}

function validateField(field) {
  resetInvalidField(field);
  if(field.value == null || field.value.trim() == "") {
    field.classList.add('invalid');
    return false;
  }
  if(field.classList.contains('password')){
    return validatePasswordField(field);
  }
  return true;
}

function validatePasswordField(field){
  var passwordValid = true;
  document.querySelector('#invalidPasswordCheckMessage').classList.add('u-displayNone')
  var paswordValue = field.value;
  var passwordFields = field.form.querySelectorAll('input[type=password]');
  passwordFields.forEach(function testPasswords(passwordInput){resetInvalidField(passwordInput)});
  passwordFields.forEach(function testPasswords(passwordInput){
    if(passwordInput.value != "" && passwordInput.value != paswordValue){
      document.querySelector('#invalidPasswordCheckMessage').classList.remove('u-displayNone')
      passwordFields.forEach(function invalidatePasswordFields(singleField){ singleField.classList.add("invalid")});
      passwordValid = false;
    }
  })
  return passwordValid;
}

function resetInvalidField(field) {
  field.classList.remove('invalid');
}

function setValidationOnRequiredFields() {
  var requiredElements = document.querySelectorAll(".required");
  requiredElements.forEach(function setOnChangeEvent(element) {
    element.addEventListener("change", function validate() {
      validateField(this);
    })
  })
  requiredCheckBoxes = document.querySelectorAll(".requiredOne");
  requiredCheckBoxes.forEach(function setOnChangeEventOne(checkboxGroup) {
    checkboxGroup.addEventListener("change", function validate() {
      validateCheckBoxes(checkboxGroup);
    })
  })
}

function resetInvalidCheckBoxGroup(checkboxGroup) {
  checkboxGroup.querySelector('.requiredMessage').classList.add('u-displayNone');
}

function validateCheckBoxes(checkboxGroup) {
  resetInvalidCheckBoxGroup(checkboxGroup);
  var checkBoxes = checkboxGroup.querySelectorAll('input[type=checkbox]');
  var isChecked = false;
  for (var i = 0; i < checkBoxes.length; i++) {
    if ( checkBoxes[i].checked ) {
      isChecked = true;
    }
  }
  if (!isChecked) checkboxGroup.querySelector('.requiredMessage').classList.remove('u-displayNone');
  return isChecked;
}
function validateForm(){
  var tabElements = document.querySelectorAll("div.BoxRegisterBody");
  var validated = true;
  tabElements.forEach(function validateTab(tabElement) {
    if (!validateFieldsOntab(tabElement)) {
      validated = false;
    }
  })
  return validated;
}

window.onload = function onLoadFunction() {
  setValidationOnRequiredFields();
}
