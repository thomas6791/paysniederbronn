import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
    console.log(this.contentTarget);
    console.log("Alien");
  }
  submitForm() {
    //this.contentTarget.innerHTML = "HELLO !"

  }
}
