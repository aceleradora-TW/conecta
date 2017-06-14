var allLinks = document.querySelectorAll(".URL");
const MAX_LINK_LENGTH = 27;
allLinks.forEach(function(link){
  link.innerHTML = link.innerHTML.substring(0, MAX_LINK_LENGTH) + "...";
});
