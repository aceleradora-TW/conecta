
var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');
var filterSearch = document.querySelectorAll('label');
var filterDescription = document.querySelector('#ReplaceFilter');

btnFilter.onclick = function expand() {
  menu.classList.toggle('DropdownMenu-visible');
  btnFilter.classList.toggle('ButtonFilter-activated');
}

window.onload = function onLoad(){
  var urlHasAnchor = location.href.indexOf("#") > 0;
  if(!urlHasAnchor){
    document.getElementById("InputSearch").focus();
  }
}

filterSearch.forEach(function(searchOption){
  searchOption.addEventListener("click", function(){
    filterDescription.innerHTML = searchOption.querySelector("span").innerHTML;
  })
});
