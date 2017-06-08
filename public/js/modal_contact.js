var modal = document.querySelector('#ModalContact');

function showModal() {
  modal.style.display = "block";
}

function closeModal() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function deleteMessage(){
  document.querySelector("#MessageModal").value = "";
  document.querySelector("#MessageModal").focus();
}
