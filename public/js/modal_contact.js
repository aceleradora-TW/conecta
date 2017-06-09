var modal = document.querySelector("#ModalContact");
var company = document.querySelector("#SendEmail");
var message = document.querySelector("#MessageModal");

function showModal(id) {
  modal.style.display = "flex";
  company.id = "SendEmail"+id;
  showMessage();
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

function showMessage(){
  message.value = "Tenho interesse em realizar uma parceria com sua empresa.";
  message.focus();
}
