import { initSweetalert } from '../plugins/init_sweetalert';

console.log("sweet alert");
initSweetalert('#sweet-alert-demo', {
  title: "A nice alert",
  text: "This is a great alert, isn't it?",
  icon: "success"
}, (value) => {
  console.log(value);
});
