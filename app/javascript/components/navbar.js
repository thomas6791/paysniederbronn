const navBar = () => {
  //console.log('Bonjour');
  const navButton = document.querySelector(".mobile-button");
  let navMenu =  document.querySelector(".nav");
  navButton.addEventListener("click", (event) => {
    navMenu.classList.toggle("visible");
  });

}
export { navBar };
