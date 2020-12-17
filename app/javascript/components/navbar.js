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
  let coookieButton = document.querySelector(".cookies-eu-ok.js-cookies-eu-ok");
  coookieButton.addEventListener( "click", (event) => {
    screen.style.display = "none";
    head.insertAdjacentHTML("afterbegin", `
      <script async src="https://www.googletagmanager.com/gtag/js?id=UA-146085492-1"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-146085492-1');
      </script>
      `);
  });
}
export { navBar };
export { cookieFullscreen };
