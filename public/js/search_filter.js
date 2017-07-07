var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');
var filterDescription = document.querySelector('#ReplaceFilter');

var filterSpans = document.querySelectorAll('span.u-fontBold.u-marginBottom');
var filterLabels = document.querySelectorAll('.filterLabel');
var inputSearch = document.querySelector('#InputSearch');
var filterRadios = document.querySelector('input[type="radio"]');
var filterDiv = document.querySelector('.DropdownMenu div');


inputSearch.addEventListener('focus', function(event){
  menu.classList.add('DropdownMenu-visible');
  event.stopPropagation();
});

inputSearch.addEventListener('click', function(event){
  event.stopPropagation();
});

menu.addEventListener('click', function(event){
  event.stopPropagation();
});

document.addEventListener('click', function(){
  menu.classList.remove('DropdownMenu-visible');
});
