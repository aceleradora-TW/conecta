var modal = document.querySelector("#ModalContact");
var company = document.querySelector("#SendEmailButton");
var message = document.querySelector("#MessageModal");

function showModal(id, InstitutionName) {
  var contact = document.querySelector("#ContactCompany");
  modal.style.display = "flex";

  var inputInstitutionId = document.querySelector("#InstitutionId");
  inputInstitutionId.value = id;
  contact.value = InstitutionName
  showMessage("Tenho interesse em realizar uma parceria com sua empresa.");
}

function closeModal() {
  modal.style.display = "none";
  company.id = "SendEmail";
}

window.onclick = function(event) {
  if (event.target == modal) {
    closeModal();
  }
}

function deleteMessage(){
  message.value = "";
  message.focus();
}

function showMessage(msg){
  message.value = msg;
  message.focus();
}

function validateForm() {
  var inputName = document.querySelector('#contactName');
  var inputEmail = document.querySelector('#contactEmail');
  
  if(inputName.value != "" && inputEmail.value != ""){
    sendMail();
  }
}

function sendMail(){
  $("#SendEmailMessage").removeClass("u-colorRed");
  $("#SendEmailMessage").removeClass("u-colorGreen");
  $("#SendEmailButton").attr("disabled","disabled");

  $("#SendEmailMessage").html("<img class='Spinner' src='images/spinner.gif'>");
  var url = "/request_contact";
  $.ajax({
    type: "POST",
    url: url,
    data: $("#ContactForm").serialize(),
    success: function(response){
      if(response.indexOf("[erro]") < 0){
        $("#SendEmailMessage").addClass("u-colorGreen");
        $("#SendEmailMessage").html(response);
        setTimeout(closeModal,3000);
      }
      else{
        $("#SendEmailMessage").addClass("u-colorLightRed");
        $("#SendEmailMessage").html(response.replace("[erro]","Erro: "));
      }
    }
  });
  $("#SendEmailButton").removeAttr("disabled");
  event.preventDefault();
}

function InvalidMsg(textbox) {
  if (textbox.value == '') {
    textbox.setCustomValidity('Campo obrigatório');
  }
  else {
    textbox.setCustomValidity('');
  }
  return true;
}
