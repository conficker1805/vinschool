import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "answer", "submit"]

  connect() {
    // Add event when user clicks on an answer
    this.answerTargets.forEach(answer => {
      answer.addEventListener("click", this.updateSubmitButtonState.bind(this));
    });

    this.updateSubmitButtonState()
    this.loadSounds()
  }

  verify() {
    let result = true

    this.answerTargets.map(input => {
      const isCorrect = input.dataset.correct == 'true'
      const selected = input.checked

      if (input.checked != isCorrect) {
        result = false
      }
    });

    this.playSound(result);
    this.highlightCorrectAnswers()
    this.addReloadButton();
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

  updateSubmitButtonState() {
    const hasChecked = this.answerTargets.some(input => input.checked)
    this.submitTarget.disabled = !hasChecked
  }

  highlightCorrectAnswers() {
    this.answerTargets.forEach(input => {
      const isCorrect = input.dataset.correct == 'true'

      if (isCorrect)
        input.nextElementSibling.classList.add("highlight")
    });
  }

  uncheckOtherAnswers(input) {
    if (!input.checked) return

    this.answerTargets.forEach(target => {
      if (target !== input) {
        target.checked = false;
      }
    });
  }

  addReloadButton() {
    const newButton = document.createElement("button")
    newButton.className = "btn btn-primary w-100"
    newButton.textContent = "Câu tiếp theo"
    newButton.addEventListener("click", () => window.location.reload())
    this.submitTarget.replaceWith(newButton)
  }
}
