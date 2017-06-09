var linksArray = document.querySelectorAll(".URL");

linksArray.forEach(function(link){
  link.innerHTML = link.innerHTML.substring(0, 27) + "...";
});
