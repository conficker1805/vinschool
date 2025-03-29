import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "answer"]

  connect() {
    // Add event when user clicks on an answer
    this.answerTargets.forEach(answer => {
      answer.addEventListener("click", this.toggleAnswer.bind(this));
    });

    this.setDefaultBlank()
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

    if (result)
      this.highlightCorrectAnswers()

    const klass = result ? 'correct' : 'incorrect'
    document.querySelector(".title").classList.add(klass);
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
    document.querySelector("[data-replace]").textContent = value;
  }

  setDefaultBlank() {
    const elm = document.querySelector("[data-replace]")
    elm.textContent = elm.getAttribute("data-replace")
  }
}
