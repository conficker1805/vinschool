import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "answer", "submit"]

  connect() {
    // Add event when user clicks on an answer
    this.answerTargets.forEach(answer => {
      answer.addEventListener("click", this.toggleAnswer.bind(this));
    });

    this.setDefaultBlank()
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

    const klass = result ? 'correct' : 'incorrect'
    document.querySelector(".title").classList.add(klass);

    // this.submitTarget.textContent = 'Câu tiếp theo'
    this.answerTargets.forEach(answerTarget => answerTarget.disabled = true);
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
        input.parentElement.classList.add("highlight")
    });
  }

  toggleAnswer(event) {
    const templateData = JSON.parse(this.templateTarget.dataset.template)
    const input = event.currentTarget;

    // console.log('templateData:', templateData);

    if (templateData.answer_type == 'single_choice')
      this.uncheckOtherAnswers(input)

    if (input.checked)
      this.setValueForBlank(input.nextElementSibling.textContent)
    else
      this.setDefaultBlank()

    this.updateSubmitButtonState()
  }

  uncheckOtherAnswers(input) {
    if (!input.checked) return

    this.answerTargets.forEach(target => {
      if (target !== input) {
        target.checked = false;
      }
    });
  }

  setValueForBlank(value) {
    const elm = document.querySelector("[data-replace]")
    if (elm) { elm.textContent = value; }
  }

  setDefaultBlank() {
    const elm = document.querySelector("[data-replace]")
    if (elm) { elm.textContent = elm.getAttribute("data-replace") }
  }
}
