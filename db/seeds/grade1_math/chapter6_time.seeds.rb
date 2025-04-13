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

10.times.each do
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

10.times.each do
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
