puts 'Creating MATH - Chapter 1'
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :choice,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    h4.title Viết phép tính tương ứng vào chỗ trống
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

# === START: Dạng bài tìm giá trị phân số của 1 số (có tử số là 1)
# Ví dụ: 1/2 của 10 là bao nhiêu?
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :choice,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    h4.title Tìm kết quả của phép tính sau:
    span == @question.options['fraction']
    |  của 
    span = @question.options['quantity']
    |  = 
    span data-replace="......"
  TEXT
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 2 },
  answers_attributes: [
    { text: '1', correct: true },
    { text: '2', correct: false },
    { text: '4', correct: false },
    { text: '6', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 4 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: true },
    { text: '4', correct: false },
    { text: '8', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 6 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: true },
    { text: '6', correct: false },
    { text: '12', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 8 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '4', correct: true },
    { text: '16', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 10 },
  answers_attributes: [
    { text: '20', correct: false },
    { text: '10', correct: false },
    { text: '5', correct: true },
    { text: '2', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 12 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: false },
    { text: '6', correct: true },
    { text: '9', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 14 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: false },
    { text: '5', correct: false },
    { text: '7', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 16 },
  answers_attributes: [
    { text: '8', correct: true },
    { text: '6', correct: false },
    { text: '4', correct: false },
    { text: '2', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 18 },
  answers_attributes: [
    { text: '4', correct: true },
    { text: '8', correct: false },
    { text: '9', correct: false },
    { text: '14', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 20 },
  answers_attributes: [
    { text: '4', correct: false },
    { text: '6', correct: false },
    { text: '8', correct: false },
    { text: '10', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 5 },
  answers_attributes: [
    { text: '1', correct: true },
    { text: '5', correct: false },
    { text: '10', correct: false },
    { text: '15', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: true },
    { text: '4', correct: false },
    { text: '15', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '0', correct: false },
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '3', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '3', correct: false },
    { text: '4', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 25 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '4', correct: true },
    { text: '5', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{10}'), quantity: 10 },
  answers_attributes: [
    { text: '1', correct: true },
    { text: '2', correct: false },
    { text: '5', correct: false },
    { text: '10', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{10}'), quantity: 20 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: true },
    { text: '5', correct: false },
    { text: '10', correct: false },
  ],
)

# === END: Dạng bài tìm giá trị phân số của 1 số (có tử số là 1) ===
