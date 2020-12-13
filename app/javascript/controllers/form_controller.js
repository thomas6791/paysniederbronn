import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]


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
}
