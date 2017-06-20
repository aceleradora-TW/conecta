const buttons = document.querySelectorAll('.TagTitle');
const companies = document.querySelector('#companies');
const research_centers = document.querySelector('#research-centers');

buttons.forEach(function(button){
  button.addEventListener("click", function(){
    if (button.classList.contains("u-colorBackgroundGreen")) {
      companies.classList.toggle("u-displayNone");
      research_centers.classList.add("u-displayNone");
    } else{
      research_centers.classList.toggle("u-displayNone");
      companies.classList.add("u-displayNone");
    }
  })
})

console.log(buttons);
