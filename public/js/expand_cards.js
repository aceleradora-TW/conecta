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
    // if(subitems[i].style.display == 'flex') {
    //   //subitems[i].style.display = 'none';
    //   subitems[i].classList.remove('active');
    //   console.log("Desativou " + subitems[i]);
    //   items[i].style.color = 'black';
    // }
    // else{
    //   //subitems[i].style.display = 'flex';
    //   subitems[i].classList.add('active');
    //   console.log("Ativou " + subitems[i]);
    //   document.querySelectorAll('.active').forEach(function(item){
    //     item.classList.remove('active');
    //     console.log("Desativou " + item);
    //   });
    //   items[i].style.color = 'rgba(52, 73, 94,0.8)';
    // }
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
