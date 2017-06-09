var modal = document.querySelector('#ModalContact');
var company = document.querySelector('#SendEmail');

function showModal(id) {
  modal.style.display = "flex";
  company.id = "SendEmail"+id;
}

function closeModal() {
  modal.style.display = "none";
  company.id = "SendEmail";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
    company.id = "SendEmail";
  }
}

function deleteMessage(){
  document.querySelector("#MessageModal").value = "";
  document.querySelector("#MessageModal").focus();
}
