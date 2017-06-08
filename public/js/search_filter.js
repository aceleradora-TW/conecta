
var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');

btnFilter.onclick = function() {
  menu.classList.toggle('DropdownMenu-visible');
  btnFilter.classList.toggle('ButtonFilter-activated');
}

window.onload = function onLoad(){
  var urlHasAnchor = location.href.indexOf("#") > 0;
  if(!urlHasAnchor){
    document.getElementById("InputSearch").focus();
  }
}
