const navBar = () => {
  //console.log('Bonjour');
  const navButton = document.querySelector(".mobile-button");
  let navMenu =  document.querySelector(".nav");
  navButton.addEventListener("click", (event) => {
    navMenu.classList.toggle("visible");
  });

}
const cookieFullscreen = () => {
  const fullScreen = document.querySelector(".cookies-eu.fullscreen");
  const coookieButton = document.querySelector(".cookies-eu-ok.js-cookies-eu-ok");
  coookieButton.addEventListener("click", (event) =>{
    fullscreen.style.display = "none";
  });
}
export { navBar };
export { cookieFullscreen };
