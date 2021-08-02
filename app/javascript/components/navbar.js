const navBar = () => {
  //console.log('Bonjour');
  const navButton = document.querySelector(".mobile-button");
  let navMenu =  document.querySelector(".nav");
  navButton.addEventListener("click", (event) => {
    navMenu.classList.toggle("visible");
  });

}
const cookieFullscreen = () => {
  const head = document.querySelector('head');
  let screen = document.querySelector(".cookies-eu.fullscreen");
  if (document.querySelector(".cookies-eu-ok.js-cookies-eu-ok") !== null) {
    let coookieButton = document.querySelector(".cookies-eu-ok.js-cookies-eu-ok");
    coookieButton.addEventListener( "click", (event) => {
    screen.style.display = "none";
    head.insertAdjacentHTML("afterbegin", `
      <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
      <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-HGY5YE4XT5&amp;l=dataLayer&amp;cx=c"></script>
      <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-146085492-1"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-146085492-1');
      </script>
      `);
    });
  }
}

const navAdmin = () => {
  let sidebar = document.querySelector(".sidebar");
  let closeBtn = document.querySelector("#btn");
  let searchBtn = document.querySelector(".bx-search");
  console.log("admin");

  closeBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
  });

  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }
}
export { navBar };
export { cookieFullscreen };
export { navAdmin };
