puts 'Creating MATH - Chapter 5 - Time Ordering'

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :time_ordering,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title = 'Sắp đơn vị thời gian theo thứ tự ' + @question.options['ordering'] + ':'
    .h5.mb-4 = @question.options['time_values'].join(', ')
    .wrap.d-flex.flex-flow-wrap.gap-3
      - @question.options['results'].each do |i|
        .square.text-success.bold.w-auto data-action="click->selector#openModal" data-result=i
    = render partial: 'shared/modals/selector', locals: { options: @question.options['time_values'] }
  TEXT
)

5.times.each do
  origin = %w[giây phút giờ ngày tuần tháng năm]
  results = origin - origin.sample(2)
  time_values = results.shuffle
  Question.create!(
    question_template:,
    options: {
      ordering: 'tăng dần',
      time_values:,
      results:,
    },
  )
end

5.times.each do
  origin =  %w[năm tháng tuần ngày giờ phút giây]
  results = origin - origin.sample(2)
  time_values = results.shuffle
  Question.create!(
    question_template:,
    options: {
      ordering: 'giảm dần',
      time_values:,
      results:,
    },
  )
end

# Tìm đơn vị thời gian DÀI HƠN X
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :time_larger_shorter,
  answer_type: :circle_answers,
  slim_content: <<~TEXT
    .title Khoanh tròn đáp án đúng
    p = 'Đơn vị thời gian dài hơn ' + @question.options['milestone'].upcase + ' là:'
    .answers.d-flex.gap-5
      - @question.options['answers'].each_with_index do |a, idx|
        input type="checkbox" id=idx class="circle-btn d-none" data-circle-answers-target="answer" data-correct=a['correct'].to_s
        label.circlable.d-inline for=idx = a['text']
  TEXT
)

5.times do
  origin =  %w[giây phút giờ ngày tuần tháng năm]
  milestone = origin[1..-2].sample
  idx = origin.index(milestone)
  smaller = origin[0...idx].map { |time| { text: time, correct: false } }
  larger = origin[(idx + 1)..].map { |time| { text: time, correct: true } }

  answers = loop do
    arr = (smaller + larger).shuffle.first(4)
    break arr if arr.pluck(:correct).any?(true)
  end

  Question.create!(
    question_template:,
    options: { milestone:, answers: },
  )
end

# Tìm đơn vị thời gian NGẮN HƠN X
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :time_larger_shorter,
  answer_type: :circle_answers,
  slim_content: <<~TEXT
    .title Khoanh tròn đáp án đúng
    p = 'Đơn vị thời gian ngắn hơn ' + @question.options['milestone'].upcase + ' là:'
    .answers.d-flex.gap-5
      - @question.options['answers'].each_with_index do |a, idx|
        input type="checkbox" id=idx class="circle-btn d-none" data-circle-answers-target="answer" data-correct=a['correct'].to_s
        label.circlable.d-inline for=idx = a['text']
  TEXT
)

5.times do
  origin =  %w[giây phút giờ ngày tuần tháng năm]
  milestone = origin[1..-2].sample
  idx = origin.index(milestone)
  smaller = origin[0...idx].map { |time| { text: time, correct: true } }
  larger = origin[(idx + 1)..].map { |time| { text: time, correct: false } }

  answers = loop do
    arr = (smaller + larger).shuffle.first(4)
    break arr if arr.pluck(:correct).any?(true)
  end

  Question.create!(
    question_template:,
    options: { milestone:, answers: },
  )
end

