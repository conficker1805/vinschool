puts 'Creating MATH - Chapter 1 - Number sequence'

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :number_sequence,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title = 'Một dãy số bắt đầu từ ' + @question.options['start'].to_s + '. Dãy số này gồm các số ' + @question.options['direction'] + ' cách đều ' + @question.options['step'].abs.to_s + ' đơn vị và dừng lại ở số ' + @question.options['stop'].to_s + '. Hãy viết dãy số bên dưới'
    .wrap.d-flex.flex-flow-wrap.gap-3
      - @question.options['results'].each do |i|
        .square.text-success.bold data-action=" click->number-selector#openModal" data-result=i
    = render partial: 'shared/modals/number_selector', locals: { options: (1..100).to_a }
  TEXT
)

def generate_sequence(step)
  input_count = 4

  loop do
    start = rand(1..95)
    results = (0..input_count - 1).to_a.map { |i| start + (i * step) }
    break [start, results] if start + (step * input_count) <= 100
  end
end

10.times.each do
  step = [1, 2, 2, 3, 3, 4, 4, 5, 5, 10].sample
  start, results = generate_sequence(step)

  Question.create!(
    question_template:,
    options: {
      start:,
      direction: 'đếm xuôi',
      step:,
      stop: results.last,
      results:,
    },
  )
end

10.times.each do
  step = [-1, -2, -2, -3, -3, -4, -4, -5, -5, -10].sample
  start, results = generate_sequence(step)

  Question.create!(
    question_template:,
    options: {
      start:,
      direction: 'đếm ngược',
      step:,
      stop: results.last,
      results:,
    },
  )
end
