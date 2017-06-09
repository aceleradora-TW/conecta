const items = document.querySelectorAll('.ItemsArea');
const subitems = document.querySelectorAll('.SubItemsArea');
for(let i = 0; i < items.length; i++) {

  items[i].addEventListener("click", function(){
    if(subitems[i].classList.contains("active")){
      subitems[i].classList.remove("active");
      return;
    }
    subitems[i].parentNode.querySelectorAll(".active").forEach(function(element){
      element.classList.remove("active");
    });
    subitems[i].classList.add("active");
  });
}
const button = document.querySelectorAll('.ButtonSeeMore');
const cardsecondary = document.querySelectorAll('.CardSecondary');
for(let i = 0; i < button.length; i++){
button[i].addEventListener("click", function(){
  if(cardsecondary[i].style.display == 'block') {
    cardsecondary[i].style.display = 'none';

  }
  else{
    cardsecondary[i].style.display = 'block';
  }
});
}
