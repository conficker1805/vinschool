import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "submit"]

  connect() {
    this.loadSounds()
  }

  verify() {
    let result = true

    const elementsWithResult = this.element.querySelectorAll('[data-result]');

    elementsWithResult.forEach((elm) => {
      if (elm.dataset.result !== elm.textContent)
        result = false;
    });

    this.playSound(result);
    this.addReloadButton();

    const klass = result ? 'correct' : 'incorrect'
    document.querySelector(".title").classList.add(klass);
  }

  loadSounds() {
    // This make the sound open faster on mobile web
    this.correctAudio = new Audio("/sounds/correct.wav");
    this.incorrectAudio = new Audio("/sounds/incorrect.wav");
    this.correctAudio.load();
    this.incorrectAudio.load();
  }

  playSound(isCorrect) {
    const sound = isCorrect ? this.correctAudio : this.incorrectAudio;
    sound.play()
  }

  addReloadButton() {
    const newButton = document.createElement("button")
    newButton.className = "btn btn-primary w-100"
    newButton.textContent = "Câu tiếp theo"
    newButton.addEventListener("click", () => window.location.reload())
    this.submitTarget.replaceWith(newButton)
  }
}
