import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "submit"]

  verify() {
    let result = true

    const elementsWithResult = this.element.querySelectorAll('[data-result]');

    elementsWithResult.forEach((elm) => {
      if (elm.dataset.result !== elm.textContent)
        result = false;
    });

    const klass = result ? 'correct' : 'incorrect'
    document.querySelector(".title").classList.add(klass);
  }
}
