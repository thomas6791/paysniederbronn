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
    swal ( "" ,  "votre produit a été ajouté au panier !" ,  "success" );
  });
});
