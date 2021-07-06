import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tabs", "tab", "outpout", "tab-contents", "tab-content" ]
  connect() {
    console.log("Parasite");
  }
  select() {
    debugger;
  }
}
