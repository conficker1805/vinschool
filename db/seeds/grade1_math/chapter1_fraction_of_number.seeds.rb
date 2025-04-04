puts 'Creating MATH - Chapter 1 - Fraction Of Number'

# === START: Dạng bài tìm giá trị phân số của 1 số (có tử số là 1)
# Ví dụ: 1/2 của 10 là bao nhiêu?
# 1/2 có nghĩa là có 2 phần và lấy 1 phần
# Vẽ 2 vòng tròn và điền cho đến khi đủ 10
# Khoanh tròn phần muốn lấy (1 phần) và đếm số lượng trong vòng tròn
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_number,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Tìm kết quả của phép tính sau:
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

# === START: Dạng bài tìm giá trị phân số của 1 số (có tử số lớn hơn 1) ===
# Ví dụ: 2/3 của 6 là bao nhiêu?
# 2/3 có nghĩa là có 3 phần và lấy 2 phần
# Vẽ 3 vòng tròn và điền cho đến khi đủ 6
# Khoanh tròn phần muốn lấy (2 phần) và đếm số lượng trong vòng tròn

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{3}'), quantity: 6 },
  answers_attributes: [
    { text: '4', correct: true },
    { text: '5', correct: false },
    { text: '6', correct: false },
    { text: '9', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{4}'), quantity: 8 },
  answers_attributes: [
    { text: '2', correct: false },
    { text: '4', correct: false },
    { text: '6', correct: true },
    { text: '8', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: false },
    { text: '6', correct: false },
    { text: '4', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: false },
    { text: '6', correct: true },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{4}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: true },
    { text: '6', correct: false },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: false },
    { text: '6', correct: true },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '9', correct: true },
    { text: '6', correct: false },
    { text: '3', correct: false },
    { text: '1', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{4}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '6', correct: false },
    { text: '8', correct: false },
    { text: '10', correct: false },
    { text: '12', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '6', correct: false },
    { text: '8', correct: true },
    { text: '10', correct: false },
    { text: '12', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '6', correct: false },
    { text: '8', correct: false },
    { text: '10', correct: false },
    { text: '12', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{4}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '16', correct: true },
    { text: '12', correct: false },
    { text: '8', correct: false },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{10}'), quantity: 10 },
  answers_attributes: [
    { text: '8', correct: false },
    { text: '6', correct: false },
    { text: '4', correct: false },
    { text: '2', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{10}'), quantity: 10 },
  answers_attributes: [
    { text: '3', correct: true },
    { text: '6', correct: false },
    { text: '9', correct: false },
    { text: '12', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{10}'), quantity: 20 },
  answers_attributes: [
    { text: '2', correct: false },
    { text: '4', correct: true },
    { text: '8', correct: false },
    { text: '10', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{10}'), quantity: 20 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: false },
    { text: '6', correct: true },
    { text: '9', correct: false },
  ],
)

# =======================================================
# question_template = QuestionTemplate.create!(
#   grade: 1,
#   subject: :math,
#   chapter: 1,
#   question_type: :fraction_of_number,
#   answer_type: :single_choice,
#   slim_content: <<~TEXT
#     .title
#       = @question.options['fraction'] + ' của một số là ' + @question.options['fraction'] '. Vậy số đó là bao nhiêu?'
#   TEXT
# )


# numerator = 3
# denominator = 10
# quantity = 20
# fraction = Katex.render('\\frac{' + numerator + '}{' + denominator + '}')

# arr = [
#   { text: quantity / denominator * numerator, correct: true },
#   { text: quantity / denominator, correct: false },
#   { text: '6', correct: false },
#   { text: '9', correct: false },
# ]

# Question.create!(
#   question_template:,
#   options: { fraction:, quantity: },
#   answers_attributes: ,
# )
