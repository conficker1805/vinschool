import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["template", "answer"]

  connect() {
    // Add event when user clicks on an answer
    this.answerTargets.forEach(answer => {
      answer.addEventListener("click", this.toggleAnswer.bind(this));
    });
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

    console.log('result:', result);
  }

  toggleAnswer(event) {
    const templateData = JSON.parse(this.templateTarget.dataset.template)
    const input = event.currentTarget;

    console.log('templateData:', templateData);

    if (templateData.answer_type == 'single_choice')
      this.uncheckOtherAnswers(input)
  }

  uncheckOtherAnswers(input) {
    if (input.checked) {
      this.answerTargets.forEach(target => {
        if (target !== input) {
          target.checked = false;
        }
      });
    }
  }
}
