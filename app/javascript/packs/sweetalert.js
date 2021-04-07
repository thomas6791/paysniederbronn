import { initSweetalert } from '../plugins/init_sweetalert';

console.log("sweet alert");
initSweetalert('#sweet-alert-demo', {
  title: "A nice alert",
  text: "This is a great alert, isn't it?",
  icon: "success"
}, (value) => {
  console.log(value);
});

Array.from(document.querySelectorAll(".sweet-alert-demo")).forEach( element => {
  element.addEventListener('click', (event) => {
    let qty = event.currentTarget.parentElement.parentElement.querySelector(".qty-control").querySelector("input").value;
    let pdt = event.currentTarget.parentElement.parentElement.querySelector("h2").innerText;
    if (event.currentTarget.parentElement.parentElement.querySelector(".qty-control").querySelector("input").value === "1") {
      swal ( "" ,  `${qty} ${pdt} est dans votre panier !` ,  "success" );
    }
    else if (event.currentTarget.parentElement.parentElement.querySelector(".qty-control").querySelector("input").value > "1") {
      swal ( "" ,  `${qty} ${pdt} sont dans votre panier !` ,  "success" );
    }
    else {
      //
    }
  });
});
