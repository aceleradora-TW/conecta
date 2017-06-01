
var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');

btnFilter.onclick = function() {
  menu.classList.toggle('DropdownMenu-visible');
  btnFilter.classList.toggle('ButtonFilter-activated');
}

window.onclick = function(event) {
  if ((!event.target.matches('.ButtonFilter')) && (!event.target.matches('.DropdownMenu')) && (!event.target.matches('.text-filter')) && (!event.target.matches('.filterLabel'))) {
    menu.classList.remove('DropdownMenu-visible');
    btnFilter.classList.remove('ButtonFilter-activated');
  }
}
