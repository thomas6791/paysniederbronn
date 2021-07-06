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
    Array.from(this.tabcontentsTarget.children).forEach( (element) =>{
      element.style.display = 'none';
      element.style.zIndex = 0;
    });
    this.tabcontentsTarget.children[index].style.display = '';
    this.tabcontentsTarget.children[index].style.zIndex = 1;
  }
}
