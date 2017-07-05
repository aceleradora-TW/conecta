var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var btnSearch = document.querySelector('.ButtonSearch');
let filterSearchfelipetto = document.querySelector('#ReplaceFilter');

function validateSearch(event) {
  if (filterSearchfelipetto.innerHTML == 'Filtre por'){
    menu.classList.toggle('DropdownMenu-visible');
    btnFilter.classList.toggle('ButtonFilter-activated');
    alert('Selecione o tipo de busca');
    return false;
  }
  document.forms['search'].submit();
}
