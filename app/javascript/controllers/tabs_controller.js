import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tabs", "tab", "tabcontents", "tabcontent" ]
  connect() {
    console.log("Parasite");
  }
  select(event) {
    event.preventDefault;
    //this.tabcontentTarget;
    let index = event.currentTarget.dataset.index;
    index = parseInt(index);
    this.tabcontentsTarget.children[index].style.visibility = 'hidden';
  }
}
