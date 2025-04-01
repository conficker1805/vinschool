puts 'Creating MATH - Chapter 1 - Repeated Addition'

# === START: Dạng bài chuyển phép cộng thành phép nhân
# Ví dụ: 2 + 2 + 2 = 15 -----> 2 x 3 = 15
# Giải thích: Quan sát thấy số 2 lặp lại 3 lần => 2 x 3 = 15, ghi lại kết quả

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :repeated_addition,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Viết phép tính tương ứng vào chỗ trống
    table.table.table-bordered.w-100
      tr
        th Phép cộng
        th Phép nhân
      tr
        td = @question.options['addition']
        td data-replace="...................."
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

Question.create!(
  question_template:,
  options: { addition: '2 + 2 + 2 + 2 = 8' },
  answers_attributes: [
    { text: '8 : 4 = 2', correct: false },
    { text: '8 : 2 = 4', correct: false },
    { text: '2 x 3 = 8', correct: false },
    { text: '2 x 4 = 8', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '5 + 5 = 10' },
  answers_attributes: [
    { text: '5 x 5 = 25', correct: false },
    { text: '5 x 2 = 10', correct: true },
    { text: '10 : 5 = 2', correct: false },
    { text: '10 : 2 = 5', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '5 + 5 + 5 = 15' },
  answers_attributes: [
    { text: '5 x 3 = 25', correct: false },
    { text: '5 x 5 = 25', correct: false },
    { text: '15 : 5 = 3', correct: false },
    { text: '5 x 3 = 15', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '5 + 5 + 5 + 5 = 20' },
  answers_attributes: [
    { text: '5 x 4 = 20', correct: true },
    { text: '5 x 4 = 25', correct: false },
    { text: '5 x 3 = 15', correct: false },
    { text: '20 : 5 = 4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '10 + 10 = 20' },
  answers_attributes: [
    { text: '10 x 2 = 200', correct: false },
    { text: '10 x 2 = 4', correct: false },
    { text: '10 x 2 = 20', correct: true },
    { text: '20 : 2 = 10', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '10 + 10 + 10 = 30' },
  answers_attributes: [
    { text: '10 x 3 = 30', correct: true },
    { text: '10 x 3 = 6', correct: false },
    { text: '10 x 3 = 300', correct: false },
    { text: '30 : 3 = 10', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { addition: '10 + 10 + 10 + 10 = 40' },
  answers_attributes: [
    { text: '10 + 4 = 40', correct: false },
    { text: '10 : 4 = 40', correct: false },
    { text: '10 x 4 = 400', correct: false },
    { text: '10 x 4 = 40', correct: true },
  ],
)
