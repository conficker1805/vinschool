import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  openModal(event) {
    this.targetElement = event.currentTarget;
    const modal = new bootstrap.Modal(document.getElementById('numberModal'));
    modal.show();
  }

  selectNumber(event) {
    const selectedNumber = event.currentTarget.dataset.numberValue;
    const targetElement = document.getElementById(this.selectedElementId);
    this.targetElement.textContent = selectedNumber;
    bootstrap.Modal.getInstance(document.getElementById('numberModal')).hide();
  }
}
