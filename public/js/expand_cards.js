const items = document.querySelectorAll('.ItemsArea');
const subitems = document.querySelectorAll('.SubItemsArea');
for(let i = 0; i < items.length; i++) {
  items[i].addEventListener("click", function(){
    if(subitems[i].style.display == 'flex') {
      subitems[i].style.display = 'none';
      items[i].style.color = 'black';
    }
    else{
      subitems[i].style.display = 'flex';
      items[i].style.color = 'rgba(52, 73, 94,0.8)';
    }
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
