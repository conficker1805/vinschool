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
        .square.text-success.bold data-action="click->selector#openModal" data-result=i
    = render partial: 'shared/modals/selector', locals: { options: (0..100).to_a }
  TEXT
)

def generate_sequence(step)
  input_count = 6

  loop do
    start = rand(5..95)
    results = (0..input_count - 1).to_a.map { |i| start + (i * step) }
    break results if results.min >= 0 || results.max <= 100
  end
end

5.times.each do
  step = [2, 2, 3, 3, 4, 4, 5, 5, 10].sample
  results = generate_sequence(step)

  Question.create!(
    question_template:,
    options: {
      start: results[0],
      stop: results[-1],
      direction: 'đếm xuôi',
      step:,
      results:,
    },
  )
end

5.times.each do
  step = [-2, -2, -3, -3, -4, -4, -5, -5, -10].sample
  results = generate_sequence(step)

  Question.create!(
    question_template:,
    options: {
      start: results[0],
      stop: results[-1],
      direction: 'đếm ngược',
      step:,
      results:,
    },
  )
end

# === Cho dãy số, điền vào chỗ trống
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :number_sequence,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    ruby:
      even_odd = ['Số chẵn', 'Số lẻ']
    .title Điền số thích hợp và trả lời câu hỏi
    .wrap.d-flex.flex-flow-wrap.gap-5
      - @question.options['results']['numbers'].each_with_index do |item, idx|
        - if idx > 2
          .color-coral-red.background-light-coral-red.square.bold.fs-4 data-action="click->selector#openModal" data-result=item
        - else
          .background-light-coral-red.square.bold.fs-4 = item
    .statement.mt-4
      span Các số trên là số chẵn hay số lẻ?
      span.color-coral-red.bold.px-2 data-action="click->selector#openModal" data-modal-name="even_odd" data-result=(@question.options['start'].even? ? even_odd.first : even_odd.last) data-replace='.....'
    .statement.mt-2
      span Mô tả: Dãy số trên bắt đầu từ
      span.color-coral-red.bold.ps-2 data-action="click->selector#openModal" data-result=@question.options['start'] data-replace='.....'
      span = ', gồm các số'
      span.color-coral-red.bold.px-2 data-action="click->selector#openModal" data-modal-name="direction" data-result=@question.options['direction'] data-replace='.....'
      span cách đều
      span.color-coral-red.bold.px-2 data-action="click->selector#openModal" data-result=@question.options['step'].abs data-replace='.....'
      span = 'đơn vị. Kết thúc ở số'
      span.color-coral-red.bold.px-2 data-action="click->selector#openModal" data-result=@question.options['stop'] data-replace='.....'
    = render partial: 'shared/modals/selector', locals: { options: (0..100).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'even_odd', options: even_odd }
    = render partial: 'shared/modals/selector', locals: { id: 'direction', options: ['đếm xuôi', 'đếm ngược'] }
  TEXT
)

5.times do
  step = [2, 2, 3, 3, 4, 4, 5, 5, 10].sample
  numbers = generate_sequence(step)

  Question.create!(
    question_template:,
    options: {
      start: numbers[0],
      stop: numbers[-1],
      direction: 'đếm xuôi',
      step:,
      results: {
        numbers:
      }
    },
  )
end

5.times.each do
  step = [-2, -2, -3, -3, -4, -4, -5, -5, -10].sample
  numbers = generate_sequence(step)

  Question.create!(
    question_template:,
    options: {
      start: numbers[0],
      stop: numbers[-1],
      direction: 'đếm ngược',
      step:,
      results: {
        numbers:
      }
    },
  )
end


