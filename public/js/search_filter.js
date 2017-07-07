
var btnFilter = document.querySelector('.ButtonFilter');
var menu = document.querySelector('.DropdownMenu');
var textFilter = document.querySelector('.text-filter');
var filterSearch = document.querySelectorAll('label');
var filterDescription = document.querySelector('#ReplaceFilter');
var inputSearch = document.querySelector('#InputSearch');
var tooltip = document.querySelector('#tooltipMessage');

if(inputSearch){
  inputSearch.addEventListener('focus', function(event){
    menu.classList.add('DropdownMenu-visible');
    console.log('focus');
  })

}

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
