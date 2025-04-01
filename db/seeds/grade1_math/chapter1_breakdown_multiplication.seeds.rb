puts 'Creating MATH - Chapter 1 - Breakdown Multiplication'

# === START: Dạng bài chuyển phép nhân thành phép cộng
# Ví dụ: 2 x 3 = 15 -----> 2 + 2 + 2 = 15
# Giải thích: Số 2 lặp lại 3 lần => 2 + 2 + 2, ghi lại kết quả

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :breakdown_multiplication,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Viết phép tính tương ứng vào chỗ trống
    table.table.table-bordered.w-100
      tr
        th Phép nhân
        th Phép cộng
      tr
        td = @question.options['addition']
        td data-replace="...................."
  TEXT
)

Question.create!(
  question_template:,
  options: { addition: '2 x 2 = 4' },
  answers_attributes: [
    { text: '2 + 2 = 4', correct: true },
    { text: '1 + 1 + 1 + 1 = 4', correct: false },
    { text: '3 + 1 = 4', correct: false },
    { text: '2 + 2 + 2 = 4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '2 x 3 = 6' },
  answers_attributes: [
    { text: '2 + 2 + 2 = 4', correct: false },
    { text: '6 : 2 = 3', correct: false },
    { text: '2 + 2 + 2 = 6', correct: true },
    { text: '2 x 3 = 6', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '2 x 4 = 8' },
  answers_attributes: [
    { text: '8 : 4 = 2', correct: false },
    { text: '8 : 2 = 4', correct: false },
    { text: '2 + 2 + 2 = 8', correct: false },
    { text: '2 + 2 + 2 + 2 = 8', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '5 x 2 = 10' },
  answers_attributes: [
    { text: '5 + 2 = 10', correct: false },
    { text: '5 + 5 = 10', correct: true },
    { text: '10 : 5 = 2', correct: false },
    { text: '5 + 5 = 25', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '5 x 3 = 15' },
  answers_attributes: [
    { text: '5 + 3 = 15', correct: false },
    { text: '5 + 5 = 15', correct: false },
    { text: '15 : 5 = 3', correct: false },
    { text: '5 + 5 + 5 = 15', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '5 x 4 = 20' },
  answers_attributes: [
    { text: '5 + 5 + 5 + 5 = 20', correct: true },
    { text: '5 + 5 + 5 = 20', correct: false },
    { text: '5 + 5 + 5 + 5 = 15', correct: false },
    { text: '20 : 5 = 4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '10 x 2 = 20' },
  answers_attributes: [
    { text: '10 + 10 = 200', correct: false },
    { text: '10 + 10 = 100', correct: false },
    { text: '10 + 10 = 20', correct: true },
    { text: '10 + 10 + 10 = 20', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '10 x 3 = 30' },
  answers_attributes: [
    { text: '10 + 10 + 10 = 30', correct: true },
    { text: '10 + 3 = 30', correct: false },
    { text: '10 + 10 = 30', correct: false },
    { text: '10 + 10 + 10 = 300', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '10 x 4 = 40' },
  answers_attributes: [
    { text: '10 + 4 = 40', correct: false },
    { text: '40 : 10 = 4', correct: false },
    { text: '10 + 10 + 10 = 40', correct: false },
    { text: '10 + 10 + 10 + 10 = 40', correct: true },
  ],
)
