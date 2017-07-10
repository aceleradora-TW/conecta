const dropdownMenu = document.querySelector('.DropdownMenu');
const inputSearch = document.querySelector('#InputSearch');
const buttonSearch = document.querySelector('#ButtonSearch');
const searchFilterElements = [inputSearch, dropdownMenu, buttonSearch];
const tooltip = document.querySelector('#tooltipMessage');

if(dropdownMenu && inputSearch){
  searchFilterElements.forEach(function(element){
    element.addEventListener('click', function(event){
      event.stopPropagation();
    });
  });
  inputSearch.addEventListener('focus', function(event){
    dropdownMenu.classList.add('DropdownMenu-visible');
    event.stopPropagation();
  });
  document.addEventListener('click', function(){
    dropdownMenu.classList.remove('DropdownMenu-visible');
  });
}

function validateFilter(){
  const requiredFilterInputs = document.querySelectorAll('.requiredFilter');
  var filterWasSelected = false;

  tooltip.classList.remove('Tooltiptext-active');
  requiredFilterInputs.forEach(function(requiredInput){
    if(requiredInput.checked) filterWasSelected = true;
    requiredInput.onchange = function(event){
      if (this.checked) tooltip.classList.remove('Tooltiptext-active');
    };
  });

  if(filterWasSelected){
    document.forms['search'].submit();
    return true;
  } else{
    tooltip.classList.add('Tooltiptext-active');
    dropdownMenu.classList.add('DropdownMenu-visible');
  }

  return false;
}
