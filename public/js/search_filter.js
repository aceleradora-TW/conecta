var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');
var filterDescription = document.querySelector('#ReplaceFilter');

var filterSpans = document.querySelectorAll('span.u-fontBold.u-marginBottom');
var filterLabels = document.querySelectorAll('.filterLabel');
var inputSearch = document.querySelector('#InputSearch');

var tooltip = document.querySelector('#tooltipMessage');

function validateFilter(){
  var requiredFilterInputs = document.querySelectorAll('.requiredFilter');
  var selectedFilter = false;

  tooltip.classList.remove('Tooltiptext-active');
  requiredFilterInputs.forEach(function(requiredInput){
    if(requiredInput.checked){
      selectedFilter = true;
    }
    requiredInput.onchange = function(event){

      if (this.checked){
        tooltip.classList.remove('Tooltiptext-active');

      }
    };
  });

  if(selectedFilter){
    document.forms['search'].submit();
    return true;
  }else{
    tooltip.classList.add('Tooltiptext-active');
  }
  return false;
}

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
