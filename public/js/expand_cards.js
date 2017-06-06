const items = document.querySelectorAll('.Items');
const subitems = document.querySelectorAll('.Subitems');
for(let i = 0; i < items.length; i++) {
  items[i].addEventListener("click", function(){
    if(subitems[i].style.display == 'block') {
      subitems[i].style.display = 'none';
      items[i].style.color = 'black';
    }
    else{
      subitems[i].style.display = 'block';
      items[i].style.color = 'rgba(52, 73, 94,0.8)';
    }
  });
}
const button = document.querySelectorAll('.u-width-medium');
const cardsecondary = document.querySelectorAll('.CardSecondary');
for(let i = 0; i < button.length; i++){
button[i].addEventListener("click", function(){
  if(cardsecondary[i].style.display == 'none') {
    cardsecondary[i].style.display = 'block';

  }
  else{
    cardsecondary[i].style.display = 'none';
  }
});
}
