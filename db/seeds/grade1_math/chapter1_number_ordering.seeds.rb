puts 'Creating MATH - Chapter 1 - Number ordering'

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :number_ordering,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title = 'Sắp xếp các số sau theo thứ tự ' + @question.options['ordering'] + ':'
    .h5.mb-4 = @question.options['numbers'].join(', ')
    .wrap.d-flex.flex-flow-wrap.gap-3
      - @question.options['results'].each do |i|
        .square.text-success.bold data-action=" click->number-selector#openModal" data-result=i
    = render partial: 'shared/modals/number_selector', locals: { options: @question.options['numbers'] }
  TEXT
)

10.times.each do
  numbers = (0..100).to_a.shuffle.first(6)
  Question.create!(
    question_template:,
    options: {
      ordering: ['từ bé đến lớn', 'tăng dần'].sample,
      numbers:,
      results: numbers.sort,
    },
  )
end

10.times.each do
  numbers = (0..100).to_a.shuffle.first(6)
  Question.create!(
    question_template:,
    options: {
      ordering: ['từ lớn đến bé', 'giảm dần'].sample,
      numbers:,
      results: numbers.sort.reverse,
    },
  )
end
