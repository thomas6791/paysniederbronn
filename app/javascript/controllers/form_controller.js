import { Controller } from "stimulus";
//import Rails from "@rails/ujs";


export default class extends Controller {
  static targets = [ "content", "dateinput", "link", "sumproduct", "todeploy" ]
  static classes = [ "hiddendate" ]


  connect() {
    document.querySelectorAll('input[data-form-target="content"]').forEach((input) =>{
      input.addEventListener("input", (event) => {
        if (event.currentTarget.value !== undefined || event.currentTarget.value !== "") {
          event.currentTarget.classList.remove("error");
        }
        else {}
      });
    });
    let qties = Array.from(document.querySelectorAll(".qty-control[data-form-qty-value]"));
    qties.forEach(element => {
      element.querySelector("input").value = element.dataset.formQtyValue;
      let price = element.parentElement.parentElement.parentElement.querySelector(".price.pricing").dataset.price;
      element.nextElementSibling.querySelector(".sumproduct").innerText = Number(element.dataset.formQtyValue * price).toFixed(2);
    });
  }

  submitForm() {
    let inputs = document.querySelectorAll('input[data-form-target="content"]');
    inputs.forEach((input) => {
      if (input.value === "") {
        input.classList.add("error");
        input.placeholder = "Ce champ est requis";
        event.preventDefault();
      }
      else {}
      console.log("aliens ///");
      //border: solid 1px red;
    });
  }
  dateInput() {
    //console.log("Malcom");
    let options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    let datevalue = this.dateinputTarget.value;
    console.log(datevalue);
    document.querySelectorAll("#delivery_date")[0].value = datevalue;
    let deliverydateDisplay = new Date(datevalue).toLocaleString('fr-FR', options);
    console.log(deliverydateDisplay);
    document.getElementById("deliverydate").innerText = `Commande pour : ${ deliverydateDisplay }`;

    let dayName = new Date(datevalue).toLocaleString('fr-fr', {weekday:'long'})
    console.log(dayName);

    let pdts = document.querySelectorAll(".list-group-item");
    pdts.forEach((item)=>{
      item.classList.remove("not-available");
      item.querySelector(".unavailable").classList.remove("visible");
      if(!item.dataset.available.includes(dayName)) {
        item.classList.add("not-available");
        item.querySelector(".unavailable").classList.add("visible");
      }
    });
    //console.log(datehidden.value);
    //datehiddenTarget.value = datevalue;
    //this.datehiddenTarget.value = datevalue;
  }
  linkDisabled(event) {
    event.preventDefault();
    console.log("Capital");
    if (event.currentTarget.id === "plus") {
      let qty = Number(event.currentTarget.parentElement.dataset.formQtyValue);
      //debugger;

      event.currentTarget.previousElementSibling.querySelector("input").value ++;
      let price = Number(event.currentTarget.parentElement.parentElement.parentElement.querySelector(".pricing").dataset.price);
      let quantity = Number(event.currentTarget.previousElementSibling.querySelector("input").value);
      let sum = price * quantity;
      event.currentTarget.parentElement.parentElement.querySelector(".sumproduct").innerText = sum.toFixed(2);
    }
    if (event.currentTarget.id === "minus") {
      event.currentTarget.nextElementSibling.querySelector("input").value --;
      let price = Number(event.currentTarget.parentElement.parentElement.parentElement.querySelector(".pricing").dataset.price);
      let quantity = Number(event.currentTarget.nextElementSibling.querySelector("input").value);
      let sum = price * quantity;
      event.currentTarget.parentElement.parentElement.querySelector(".sumproduct").innerText = sum.toFixed(2);
    }
  }
  deploy() {
    this.todeployTarget.classList.toggle("deployed");
  }

}
