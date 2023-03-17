import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slideout"
export default class extends Controller {
  static targets = ["sidebar"]
  connect() {
  }

  show() {
    console.log("click");
    this.sidebarTarget.classList.toggle('active');
   this.element.classList.toggle('justify-content-center');
   this.element.classList.toggle('justify-content-end');
  }
}
