
var btnFilter = document.querySelector('.btn-filter');
var menu = document.querySelector('.dropdown-menu');
var textFilter = document.querySelector('.text-filter');

btnFilter.onclick = function() {
  menu.classList.toggle('dropdown-menu-visible');
  btnFilter.classList.toggle('btn-filter-activated');
}

window.onclick = function(event) {
  if ((!event.target.matches('.btn-filter')) && (!event.target.matches('.dropdown-menu')) && (!event.target.matches('.text-filter')) && (!event.target.matches('.filterLabel'))) {
    menu.classList.remove('dropdown-menu-visible');
    btnFilter.classList.remove('btn-filter-activated');
  }
}
