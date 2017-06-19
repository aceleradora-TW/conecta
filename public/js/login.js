function login(){
  $("#LoginMessage").removeClass("u-colorRed");
  $("#LoginMessage").removeClass("u-colorGreen");
  $("#LoginButton").attr("disabled","disabled");

  $("#LoginMessage").html("<img class='Spinner' src='images/spinner.gif'>");
  var url = "/session";
  $.ajax({
    type: "POST",
    url: url,
    data: $("#LoginForm").serialize(),
    success: function(response){
      if(response.indexOf("[erro]") < 0){
        $("#LoginMessage").addClass("u-colorGreen");
        $("#LoginMessage").html(response);
      }
      else{
        $("#LoginMessage").addClass("u-colorLightRed");
        $("#LoginMessage").html(response.replace("[erro]","Erro: "));
      }
      $("#LoginButton").removeAttr("disabled");
    }
  });
  event.preventDefault();
}
