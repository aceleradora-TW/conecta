var initialize = function(){
  changeOnScroll();
};

var verifyScrolled = function(scrolled){
  var navbar = document.querySelector('.Navbar');
  console.log(navbar);
  if (scrolled){
    navbar.classList.add('is-scrolling');
  }else{
    navbar.classList.remove('is-scrolling');
  }
};


var changeOnScroll = function(){
  window.addEventListener('scroll', function(){
    if (window.scrollY > 0) {
      verifyScrolled(true);
    }
    else {
      verifyScrolled(false);
    }
  });
};

initialize();
