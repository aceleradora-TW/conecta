
var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');
var filterSearch = document.querySelectorAll('label');
var filterDescription = document.querySelector('#ReplaceFilter');
var inputSearch = document.querySelector('#InputSearch');

window.onload = function onLoad(){
  var urlHasAnchor = location.href.indexOf("#") > 0;
  if(!urlHasAnchor){
    document.getElementById("InputSearch").focus();
  }
}

if(inputSearch){
  inputSearch.addEventListener('focus', function(e){
    menu.classList.add('DropdownMenu-visible');
    console.log('focus');
  })

}
