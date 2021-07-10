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
      element.style.position = 'absolute';
      element.style.zIndex = -1;
      //element.style.visibility = "hidden";
    });
    this.tabcontentsTarget.children[index].style.position = 'inherit';
    this.tabcontentsTarget.children[index].style.zIndex = 1;
    //this.tabcontentTarget.children[index].style.visibility = "visible";
    Array.from(this.tabsTarget.children).forEach( (element)=>{
      element.classList.remove("active");
      Array.from(this.tabcontentsTarget.children).forEach( (element) =>{
        element.style.visibility = "hidden";
      });
    });
    event.currentTarget.classList.add("active");
    this.tabcontentsTarget.children[index].style.visibility = "visible";
  }
}
