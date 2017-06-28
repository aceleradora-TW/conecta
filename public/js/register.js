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
function validateFieldsActiveTab(){
  var valid = true;
  var tabElement = document.querySelector("div.BoxRegisterBody.active");
  var requiredElements = tabElement.querySelectorAll(".required");
  resetInvalidFields(requiredElements);
  requiredElements.forEach(function validateRequiredElements(element) {
    if (!validateField(element)) {
      valid = false;
    }
  })
  return valid;
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
  return true;
}

function resetInvalidField(field) {
  field.classList.remove('invalid');
}

function setOnChangeRequiredFields() {
  var requiredElements = document.querySelectorAll(".required");
  requiredElements.forEach(function setOnChangeEvent(element) {
    element.addEventListener("change", function validate() {
      validateField(this);
    })
  })
}

window.onload = function onLoadFunction() {
  setOnChangeRequiredFields();
}
