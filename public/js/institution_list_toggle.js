const buttons = document.querySelectorAll('.TagTitle');
const companies = document.querySelector('#companies');
const research_centers = document.querySelector('#research-centers');

if(buttons && buttons.constructor === NodeList){
  buttons.forEach(function(button){
    button.addEventListener("click", function(){
      if (button.classList.contains("js-companies")) {
        companies.classList.remove("u-displayNone");
        research_centers.classList.add("u-displayNone");
      } else if(button.classList.contains("js-researchCenters")){
        research_centers.classList.remove("u-displayNone");
        companies.classList.add("u-displayNone");
      } else {
        research_centers.classList.remove("u-displayNone");
        companies.classList.remove("u-displayNone");
      }
    });
  });
}
function confirmDelete(institutionId, institutionName){
  if(confirm('Tem certeza que deseja excluir a instituição "' + institutionName + '"?')){
    location.href = "/admin/delete/" + institutionId;
  }
}
