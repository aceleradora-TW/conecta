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
const cardSecondary = document.querySelectorAll('.CardSecondary');
for(let i = 0; i < button.length; i++){
  button[i].addEventListener("click", function(){
    if(cardSecondary[i].style.display == 'block') {
      cardSecondary[i].style.display = 'none';
    }
    else{
      cardSecondary[i].style.display = 'block';
    }
  });
}
