# Thực hiện phép tình cộng hoặc trừ: 33 + 25 = []
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers_addition_subtraction,
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

def random_numbers_for_addition # Random numbers cho phép cộng không nhớ
  loop do
    a = rand(1..99)
    b = rand(1..99)
    unit_sum  = a % 10 + b % 10
    tens_sum  = a / 10 + b / 10
    total_sum = a + b

    if total_sum <= 100 && unit_sum <= 9 && tens_sum <= 9
      break [a, b]
    end
  end
end

def random_numbers_for_subtraction
  loop do
    a = rand(10..100)
    b = rand(0..a)

    a_tens, a_units = a / 10, a % 10
    b_tens, b_units = b / 10, b % 10

    if a_units >= b_units && a_tens >= b_tens
      break [a, b]
    end
  end
end

# Phép cộng
10.times do
  num1, num2 = random_numbers_for_addition
  result = num1 + num2

  Question.create!(
    question_template:,
    options: { num1:, num2:, operation: '+' , result: },
  )
end

# Phép trừ
10.times do
  num1, num2 = random_numbers_for_subtraction
  result = num1 - num2

  Question.create!(
    question_template:,
    options: { num1:, num2:, operation: '-' , result: },
  )
end

