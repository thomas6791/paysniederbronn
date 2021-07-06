import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tabs", "tab", "tabcontents", "tabcontent" ]
  connect() {
    console.log("Parasite");
  }
  select() {
    this.tabcontentTarget;
    debugger;
  }
}
