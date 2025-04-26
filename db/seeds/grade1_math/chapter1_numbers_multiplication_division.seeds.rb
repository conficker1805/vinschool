puts 'Creating MATH - Chapter 1 - Multiplication & Division'

# Thực hiện phép tính cộng hoặc trừ: 33 + 25 = []
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers_multiplication_division,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Thực hiện phép tính sau
    .calculation.d-flex.align-items-center.gap-3.fs-5.bold
      span = @question.options['num1']
      span = ' ' + @question.options['operation'] + ' '
      span = @question.options['num2']
      span = ' = '
      .square.text-success.bold data-action="click->selector#openModal" data-result=@question.options['result']
    = render partial: 'shared/modals/selector', locals: { options: (0..100).to_a }
  TEXT
)

# Phép nhân
20.times do
  num1, num2 = [[1, 2, 2, 2, 5, 5, 5, 10].sample, (1..10).to_a.sample].shuffle
  result = num1 * num2

  Question.create!(
    question_template:,
    options: { num1:, num2:, operation: 'x' , result: },
  )
end

# Phép chia
20.times do
  num2, result = [[1, 2, 2, 2, 5, 5, 5, 10].sample, (1..10).to_a.sample].shuffle
  num1 = result * num2

  Question.create!(
    question_template:,
    options: { num1:, num2:, operation: ':' , result: },
  )
end
