puts 'Creating MATH - Chapter 1 - Numbers'

# Điền số vào ô trống
# 26 = []0 + []
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Điền số còn thiếu vào chỗ trống
    .d-flex.align-items-center
      .square.border-end-0 = @question.options['numbers']['num1']
      .square = @question.options['numbers']['num2']
      span.bold.mx-3.fs-5 = '='
      .square.border-end-0.text-success.bold data-action="click->number-selector#openModal" data-result=@question.options['results']['num1']
      .square = @question.options['numbers']['num3']
      span.bold.mx-3.fs-5 +
      .square.text-success.bold data-action=" click->number-selector#openModal" data-result=@question.options['results']['num2']
    = render partial: 'shared/modals/number_selector', locals: { options: (0..9).to_a }
  TEXT
)

10.times.each do
  random = rand(11..99)
  num1 = random / 10
  num2 = random % 10

  Question.create!(
    question_template:,
    options: {
      numbers: { num1:, num2:, num3: 0 },
      results: { num1:, num2: },
    },
  )
end

# =============================================
# Điền số vào ô trống
# 20 = [][] - 6
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Điền số còn thiếu vào chỗ trống
    .d-flex.align-items-center
      .square.border-end-0 = @question.options['numbers']['num1']
      .square = @question.options['numbers']['num2']
      span.bold.mx-3.fs-5 = '='
      .square.border-end-0.text-success.bold data-action="click->number-selector#openModal" data-result=@question.options['results']['num1']
      .square.text-success.bold data-action="click->number-selector#openModal" data-result=@question.options['results']['num2']
      span.bold.mx-3.fs-5 -
      .square = @question.options['numbers']['num3']
    = render partial: 'shared/modals/number_selector', locals: { options: (0..9).to_a }
  TEXT
)

10.times.each do
  random = rand(11..99)
  num1 = random / 10
  num2 = random % 10
  num3 = rand(1..9)
  result = random + num3

  Question.create!(
    question_template:,
    options: {
      numbers: { num1:, num2:, num3: },
      results: { num1: result / 10, num2: result % 10 },
    },
  )
end


