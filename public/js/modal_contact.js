const modal = document.querySelector("#ModalContact");
const company = document.querySelector("#SendEmailButton");
const message = document.querySelector("#MessageModal");

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
  document.getElementById("SendEmailMessage").innerHTML = "";
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

function sendMail(){
  $("#SendEmailMessage").removeClass("u-colorLightRed");
  $("#SendEmailMessage").removeClass("u-colorGreen");

  var email = $("#email").val();

  document.querySelector("#invalidEmailMessage").style.display = "none";
  document.querySelector("#email").style.borderColor = "rgba(193, 193, 193, 1)"

  if (isValidEmail(email)) {
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
          setTimeout(closeModal, 3000);
        }
        else{
          $("#SendEmailMessage").html(response.replace("[erro]","Erro: "));
        }
        $("#SendEmailButton").removeAttr("disabled");
      }
    });
  } else {
    document.querySelector("#invalidEmailMessage").style.display = "flex";
    document.querySelector("#email").style.borderColor = "rgba(255, 0, 0, 1)"
  }
  event.preventDefault();
}
