import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading-spin"
export default class extends Controller {
  static targets = ["cancel","load"]
  connect() {
    console.log("loading spin")
  }
  insertspin() {
    // console.log("maaa")
    this.loadTarget.innerHTML=" <i class='fa-solid fa-cog fa-spin'></i>"
    // window.addEventListener('load',()=> {
    //   console.log("alfjlasdjf");
    //   this.cancelTarget.style.display= "none";
    // })
    // this.cancelTarget.style.display= "none";


  }
}
