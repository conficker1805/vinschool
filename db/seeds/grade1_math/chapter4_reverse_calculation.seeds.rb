puts 'Creating MATH - Chapter 4 - Reverse Calculation'

# === START: Dạng bài tìm phép tính ngược
# Giải thích: Đối với phép trừ thì dùng kết quả trừ cho "số trừ", đối với phép chia thì chia cho số đầu tiên
# Ví dụ 2 + 1 = 3 => 3 - 1 = 2
# Ví dụ 2 x 3 = 6 => 6 : 2 = 3
# Ví dụ 50 – 10 = 40 => 40 + 10 = 50
# Ví dụ 70 : 10 = 7 => 10 x 7 = 70

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :reverse_calculation,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Tìm phép tính ngược của phép tính dưới đây:
    p = @question.options['text']
  TEXT
)

Question.create!(
  question_template:,
  options: { text: '24 + 65 = 89' },
  answers_attributes: [
    { text: '65 + 24 = 89', correct: false },
    { text: '89 - 24 = 65', correct: false },
    { text: '89 - 65 = 24', correct: true },
    { text: '65 - 89 = 24', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '31 + 62 = 93' },
  answers_attributes: [
    { text: '62 + 31 = 93', correct: false },
    { text: '93 - 62 = 31', correct: true },
    { text: '93 - 31 = 62', correct: false },
    { text: '62 - 93 = 31', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '22 + 25 = 47' },
  answers_attributes: [
    { text: '25 + 22 = 47', correct: false },
    { text: '47 - 22 = 25', correct: false },
    { text: '25 - 47 = 22', correct: false },
    { text: '47 - 25 = 22', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { text: '91 + 4 = 95' },
  answers_attributes: [
    { text: '95 - 4 = 91', correct: true },
    { text: '4 + 91 = 95', correct: false },
    { text: '95 - 91 = 4', correct: false },
    { text: '4 - 95 = 91', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '70 + 5 = 75' },
  answers_attributes: [
    { text: '5 + 70 = 75', correct: false },
    { text: '75 - 5 = 70', correct: true },
    { text: '75 - 70 = 5', correct: false },
    { text: '5 - 75 = 70', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '50 – 10 = 40' },
  answers_attributes: [
    { text: '50 - 40 = 10', correct: false },
    { text: '10 + 40 = 50', correct: false },
    { text: '40 + 10 = 50', correct: true },
    { text: '50 + 10 = 40', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '99 – 9 = 90' },
  answers_attributes: [
    { text: '90 + 9 = 99', correct: true },
    { text: '99 - 90 = 9', correct: false },
    { text: '9 + 90 = 99', correct: false },
    { text: '99 + 9 = 90', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '57 – 33 = 24' },
  answers_attributes: [
    { text: '57 - 24 = 33', correct: false },
    { text: '33 + 24 = 57', correct: false },
    { text: '57 + 33 = 24', correct: false },
    { text: '24 + 33 = 57', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { text: '82 – 22 = 60' },
  answers_attributes: [
    { text: '82 - 60 = 22', correct: false },
    { text: '60 + 22 = 82', correct: true },
    { text: '22 + 60 = 82', correct: false },
    { text: '82 + 22 = 60', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '49 – 7 = 42' },
  answers_attributes: [
    { text: '49 - 42 = 7', correct: false },
    { text: '7 + 42 = 49', correct: false },
    { text: '49 + 7 = 42', correct: false },
    { text: '42 + 7 = 49', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { text: '10 x 5 = 50' },
  answers_attributes: [
    { text: '50 x 10 = 5', correct: false },
    { text: '50 : 10 = 5', correct: true },
    { text: '50 : 5 = 10', correct: false },
    { text: '10 : 5 = 50', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '5 x 8 = 40' },
  answers_attributes: [
    { text: '40 : 5 = 8', correct: true },
    { text: '40 x 5 = 8', correct: false },
    { text: '40 : 8 = 5', correct: false },
    { text: '5 : 8 = 40', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '2 x 9 = 18' },
  answers_attributes: [
    { text: '18 x 2 = 9', correct: false },
    { text: '18 : 9 = 2', correct: false },
    { text: '18 : 2 = 9', correct: true },
    { text: '2 : 9 = 18', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '2 x 7 = 14' },
  answers_attributes: [
    { text: '14 x 2 = 7', correct: false },
    { text: '14 : 7 = 2', correct: false },
    { text: '2 : 7 = 14', correct: false },
    { text: '14 : 2 = 7', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { text: '5 x 6 = 30' },
  answers_attributes: [
    { text: '30 x 5 = 6', correct: false },
    { text: '30 : 6 = 5', correct: false },
    { text: '30 : 5 = 6', correct: true },
    { text: '5 : 6 = 30', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '40 : 5 = 8' },
  answers_attributes: [
    { text: '5 x 8 = 40', correct: true },
    { text: '40 : 5 = 8', correct: false },
    { text: '40 x 5 = 8', correct: false },
    { text: '8 x 5 = 40', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '10 : 2 = 5' },
  answers_attributes: [
    { text: '2 x 5 = 10', correct: true },
    { text: '10 : 2 = 5', correct: false },
    { text: '10 x 2 = 5', correct: false },
    { text: '5 x 2 = 10', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '45 : 5 = 9' },
  answers_attributes: [
    { text: '45 : 5 = 9', correct: false },
    { text: '5 x 9 = 45', correct: true },
    { text: '45 x 5 = 9', correct: false },
    { text: '9 x 5 = 45', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '18 : 2 = 9' },
  answers_attributes: [
    { text: '18 : 2 = 9', correct: false },
    { text: '18 x 2 = 9', correct: false },
    { text: '2 x 9 = 18', correct: true },
    { text: '9 x 2 = 18', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { text: '70 : 10 = 7' },
  answers_attributes: [
    { text: '70 : 10 = 7', correct: false },
    { text: '70 x 10 = 7', correct: false },
    { text: '7 x 10 = 70', correct: false },
    { text: '10 x 7 = 70', correct: true },
  ],
)
