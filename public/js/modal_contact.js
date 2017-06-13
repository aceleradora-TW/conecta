var modal = document.querySelector("#ModalContact");
var company = document.querySelector("#SendEmail");
var message = document.querySelector("#MessageModal");

function showModal(id, ContactCompany) {
  var contact = document.querySelector("#ContactCompany");
  modal.style.display = "flex";
  company.id = "SendEmail"+id;
  contact.value = ContactCompany;

  var inputInstitutionId = document.querySelector("#institution_id");
  inputInstitutionId.value = id;
  console.log(inputInstitutionId);
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
