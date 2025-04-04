['question_templates', 'questions', 'answers'].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
end

puts '---------GRADE 1--------'

puts 'Creating MATH - Chapter 1'
Rake::Task['db:seed:grade1_math:chapter1_repeated_addition'].invoke
Rake::Task['db:seed:grade1_math:chapter1_fraction_of_number'].invoke
Rake::Task['db:seed:grade1_math:chapter1_breakdown_multiplication'].invoke

puts 'Creating MATH - Chapter 3'
Rake::Task['db:seed:grade1_math:chapter3_money_calculation'].invoke

puts 'Creating MATH - Chapter 4'
Rake::Task['db:seed:grade1_math:chapter4_reverse_calculation'].invoke
Rake::Task['db:seed:grade1_math:chapter4_statistical_chart_quantity_comparison'].invoke

puts 'Creating MATH - Chapter 5'
Rake::Task['db:seed:grade1_math:chapter5_clock'].invoke

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :reverse_calculation,
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
    = render 'shared/modals/number_selector'
  TEXT
)

Question.create!(
  question_template:,
  options: {
    numbers: { num1: 2, num2: 6, num3: 0 },
    results: { num1: 2, num2: 6 },
  },
)
