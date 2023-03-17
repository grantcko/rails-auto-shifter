import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';

// Connects to data-controller="sortable"
export default class extends Controller {
  connect() {
    Sortable.create(this.element, {
      ghostClass: "ghost",
      group: "shared",
      animation: 150,
      onEnd: (event) => {
        console.log(event.from.dataset)
        // Sends an AJAX request to update the assignment
        if (event.from.dataset.method === "create") {
          this.createAssignment(event);
        } else {
          this.destroyAssignment(event);
        }
      },
    });
  }
  createAssignment(event){
    console.log(event)
    const url = '/assignments';
    fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ assignment: { user_id: event.item.dataset.id, shift_id: event.to.dataset.shiftId } }),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        const div = `shift-status-${data.shift_id}`
        console.log(div)
        document.getElementById(div).innerHTML = data.partial
      });
  }

  destroyAssignment(event){
    console.log(event)
    const url = `/assignments/${event.item.dataset.id}`;
    fetch(url, {
      method: "DELETE",
      headers: { "Content-Type": "application/json" },
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        const div = `shift-status-${data.shift_id}`
        console.log(div)
        document.getElementById(div).innerHTML = data.partial
      });
  }
}
