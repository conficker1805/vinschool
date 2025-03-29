puts 'Creating MATH - Chapter 1'
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :choice,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .col-md-8.question-section.h-100
      table.table.table-bordered.w-100
        tr
          th Phép cộng
          th Phép nhân
        tr
          td = @question.options['addition']
          td ....................

    .col-md-4.answers-section.h-100
      .choices
        - @question.answers.each_with_index do |answer, index|
          .answer
            input type="checkbox" id=index class="toggle-btn d-none"
            label for=index class="toggle-lbl" = answer.text
      .controls
        .btn.btn-primary.w-100 Kiểm tra
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
