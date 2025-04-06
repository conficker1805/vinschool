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
# 1/2 của một số là 2 vậy số đó là bao nhiêu?
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_number,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title
      == @question.options['fraction']
      = ' của một số là ' + @question.options['quantity'].to_s + '. Vậy số đó là bao nhiêu?'
  TEXT
)

data = [[1, 2, 1], [1, 2, 3], [1, 2, 5], [1, 2, 7], [1, 2, 9], [1, 3, 3], [1, 3, 4], [1, 4, 2], [1, 5, 2], [1, 5, 4], [1, 5, 6], [1, 5, 8], [1, 5, 10], [1, 10, 2], [1, 10, 1]]
data.each do |arr|
  numerator, denominator, quantity = arr
  fraction = Katex.render('\\frac{' + numerator.to_s + '}{' + denominator.to_s + '}')

  arr = [
    { text: quantity * denominator / numerator, correct: true },
    { text: quantity * denominator / numerator + 1, correct: false },
    { text: Katex.render('\\frac{' + quantity.to_s + '}{' + denominator.to_s + '}'), correct: false },
    { text: Katex.render('\\frac{' + denominator.to_s + '}{' + quantity.to_s + '}'), correct: false },
    { text: quantity + denominator, correct: false },
  ]

  Question.create!(
    question_template:,
    options: { fraction:, quantity: },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

# =======================================================
# 1/2 của một số là 2 vậy 1/4 của số đó là bao nhiêu?
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_number,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title
      == @question.options['fraction1']
      = ' của một số là ' + @question.options['quantity'].to_s + '. Vậy '
      == @question.options['fraction2']
      |  của số đó là bao nhiêu?
  TEXT
)

data = [[1, 2, 1, 4, 2], [1, 2, 1, 4, 4], [1, 2, 1, 3, 6], [1, 2, 1, 4, 8], [1, 2, 1, 5, 5], [1, 2, 1, 5, 10], [1, 3, 1, 4, 4], [1, 4, 1, 2, 1], [1, 4, 1, 2, 2], [1, 4, 1, 3, 3], [1, 4, 1, 8, 4], [1, 5, 1, 2, 2], [1, 5, 1, 2, 4], [1, 5, 1, 5, 4], [1, 5, 1, 4, 4]]
data.each do |arr|
  numerator1, denominator1, numerator2, denominator2, quantity = arr
  fraction1 = Katex.render('\\frac{' + numerator1.to_s + '}{' + denominator1.to_s + '}')
  fraction2 = Katex.render('\\frac{' + numerator2.to_s + '}{' + denominator2.to_s + '}')

  number = quantity * denominator1 / numerator1
  result = number / denominator2 * numerator2

  arr = [
    { text: result, correct: true },
    { text: number, correct: false },
    { text: numerator2, correct: false },
    { text: denominator1 + denominator2, correct: false },
    { text: quantity * denominator2, correct: false },
  ]

  Question.create!(
    question_template:,
    options: { fraction1:, fraction2:, quantity: },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

