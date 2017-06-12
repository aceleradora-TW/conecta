const items = document.querySelectorAll('.ItemsArea');
const subitems = document.querySelectorAll('.SubItemsArea');


items.forEach(function(item, index){
  item.addEventListener("click", function(){
    if(subitems[index].classList.contains("Open")){
      subitems[index].classList.remove("Open");
    } else {
      document.querySelectorAll(".Open").forEach(function close(element){
        element.classList.remove("Open");
      });
      subitems[index].classList.add("Open");
    }
  });
});

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
