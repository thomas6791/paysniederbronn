const navBar = () => {
  //console.log('Bonjour');
  const navButton = document.querySelector(".mobile-button");
  let navMenu =  document.querySelector(".nav");
  navButton.addEventListener("click", (event) => {
    navMenu.classList.toggle("visible");
  });

}
const cookieFullscreen = () => {
  let screen = document.querySelector(".cookies-eu.fullscreen");
  let coookieButton = document.querySelector(".cookies-eu-ok.js-cookies-eu-ok");
  coookieButton.addEventListener( "click", (event) => {
    screen.style.display = "none";
  });
}
export { navBar };
export { cookieFullscreen };
