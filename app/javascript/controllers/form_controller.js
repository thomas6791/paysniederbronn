import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content", "dateinput", "link" ]
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
    let datevalue = this.dateinputTarget.value;
    console.log(datevalue);
    document.querySelectorAll("#delivery_date")[0].value = datevalue;
    //console.log(datehidden.value);
    //datehiddenTarget.value = datevalue;
    //this.datehiddenTarget.value = datevalue;
  }
  linkDisabled(event) {
    event.preventDefault();
    console.log("Capital");
    debugger;
    if (event.currentTarget.id === "plus") {
      event.currentTarget.nextElementSibling.querySelector("input").value ++
    }
    if (event.currentTarget.id === "minus") {
      event.currentTarget.previousElementSibling.querySelector("input").value --
    }
  }
}
