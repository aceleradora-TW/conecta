
var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');
var filterSearch = document.querySelectorAll('label');
var filterDescription = document.querySelector('#ReplaceFilter');
if(btnFilter){
  btnFilter.onclick = function() {
    menu.classList.toggle('DropdownMenu-visible');
    btnFilter.classList.toggle('ButtonFilter-activated');
  }
}


window.onload = function onLoad(){
  var urlHasAnchor = location.href.indexOf("#") > 0;
  if(!urlHasAnchor){
    var inputSearch = document.getElementById("InputSearch");
    if(inputSearch){
      inputSearch.focus();
    }
  }
}
if(filterSearch && filterSearch.constructor === Array){
  filterSearch.forEach(function(searchOption){
    searchOption.addEventListener("click", function(){
      filterDescription.innerHTML = searchOption.querySelector("span").innerHTML;
    })
  });
}
