function openTab(buttonId, tabClass, tabLinkClass, tabId) {

  var i, tabcontent, tablinks;

  tabcontent = document.getElementsByClassName(tabClass);
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].classList.add("u-displayNone");
  }

  tablinks = document.getElementsByClassName(tabLinkClass);
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].classList.remove("u-colorBackgroundDarkerBlue");
  }

  document.getElementById(tabId).classList.remove("u-displayNone");
  console.log(document.getElementById(buttonId))
  document.getElementById(buttonId).classList.add("u-colorBackgroundDarkerBlue");
}

function changeRegisterTab(buttonId,tabId){
  openTab(buttonId,"BoxRegisterBody","ButtonChangeTab",tabId);
}
