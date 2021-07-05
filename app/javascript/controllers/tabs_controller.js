import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tabs", "outpout" ]
  connect() {
    console.log("Parasite");
  }
  select() {}
}
