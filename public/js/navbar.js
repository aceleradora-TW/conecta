var hamburger = document.querySelector('.Hamburger');
var navLinks =  document.querySelector('.NavLinks');
var Navbar = document.querySelector('.Navbar');
hamburger.addEventListener("click", function() {
  if (navLinks.style.display == "none" || navLinks.style.display === "") {
    navLinks.style.display = "flex";
    Navbar.style.background = "rgba(0,0,0,0.55)";
    Navbar.style.height = "37vh";
  } else {
    navLinks.style.display = "none";
    Navbar.style.background = "rgba(0,0,0,0.47)";
    Navbar.style.height = "15vh";
  }
});
