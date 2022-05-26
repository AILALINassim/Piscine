var menu = document.getElementById("menu");
var menuBack = document.getElementById("menuBack");
var search = document.getElementById("search");
var appointment = document.getElementById("appointment");

// show menu ============================
const showMobileMenuHandler = () => {
  menu.style.right = "0px";
  menuBack.style.display = "block";
}


// hide menu ===================
const hideMobileMenuHandler = () => {
    menu.style.right = "100%";
    menuBack.style.display = "none";
  }



//   showSearch 


const showSearchHandler = () => {
    search.style.display ="block";
}


// hide search ==========

const hideSearchHandler = () => {
    search.style.display ="none";
}



// showAppointment here ==============

const showAppointHandler = () => {
    appointment.style.display = "block";
}

// hide appointment handler ======

const hideAppointHandler = () => {
    appointment.style.display = "none";
}