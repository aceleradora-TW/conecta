window.onscroll = function() {showButtonWhenScrolled()};

function showButtonWhenScrolled() {
  var backToTopButton = document.querySelector("#backToTopButton");
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    backToTopButton.classList.add("u-displayBlock");
  } else {
    backToTopButton.classList.remove("u-displayBlock");
  }
}
function scrollBackToTop() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}
