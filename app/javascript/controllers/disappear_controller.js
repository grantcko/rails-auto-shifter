import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disappear"
export default class extends Controller {
  connect() {
    console.log("disappear")
  }
}
