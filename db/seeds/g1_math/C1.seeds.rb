puts 'Creating MATH - Chapter 1'
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :choice,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .col-md-8.question-section.h-100
      h4.title.bold Viết phép tính tương ứng vào chỗ trống
      table.table.table-bordered.w-100
        tr
          th Phép cộng
          th Phép nhân
        tr
          td = @question.options['addition']
          td data-replace="...................."
    .col-md-4.answers-section.h-100
      .choices
        - @question.answers.each_with_index do |a, idx|
          .answer
            input type="checkbox" id=idx class="toggle-btn d-none" data-answer-target="answer" data-correct=a.correct.to_s
            label for=idx class="toggle-lbl" = a.text
      = render partial: 'questions/controls'
  TEXT
)

Question.create!(
  question_template:,
  options: { addition: '2 + 2 = 4' },
  answers_attributes: [
    { text: '2 x 2 = 4', correct: true },
    { text: '4 : 2 = 2', correct: false },
    { text: '2 x 4 = 8', correct: false },
    { text: '2 x 2 = 2', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '2 + 2 + 2 = 6' },
  answers_attributes: [
    { text: '2 x 3 = 9', correct: false },
    { text: '6 : 2 = 3', correct: false },
    { text: '2 x 3 = 6', correct: true },
    { text: '3 x 3 = 9', correct: false },
  ],
)
