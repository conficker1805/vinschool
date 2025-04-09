import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  openModal(event) {
    this.targetElement = event.currentTarget;
    this.modalName = this.targetElement.dataset.modalName || 'selectorModal'
    const modal = new bootstrap.Modal(document.getElementById(this.modalName));
    modal.show();
  }

  select(event) {
    const selectedValue = event.currentTarget.dataset.value;
    const targetElement = document.getElementById(this.selectedElementId);
    this.targetElement.textContent = selectedValue;
    bootstrap.Modal.getInstance(document.getElementById(this.modalName)).hide();
  }
}
