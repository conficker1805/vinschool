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

# Điền số vào đồng hồ điện tử để khớp với đồng hồ kim
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :digital_watch,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    ruby:
      hour = @question.options['hour']
      minute = @question.options['minute']
      hour_angle = (hour % 12) * 30 + minute * 0.5
      minute_angle = minute * 6
      hour_string = '--angle: ' + hour_angle.to_s + 'deg'
      minute_string = '--angle: ' + minute_angle.to_s + 'deg'
    .title Điền số vào đồng hồ điện tử để khớp với đồng hồ kim
    .clock.mb-4
      .hand.hour style=hour_string
      .hand.minute style=minute_string
      .tick-marks
        - (0...60).each do |i|
          - is_hour = i % 5 == 0
          - angle = '--angle: ' + (i * 6).to_s + 'deg'
          .tick class=(is_hour ? 'tick--hour' : 'tick--minute') style=angle
      .numbers
        - (1..12).each do |i|
          - angle = '--angle: ' + ((i * 30) - 1).to_s + 'deg'
          .number style=angle = i
      .digital-watch
        .dw-hour.text-success.bold data-action="click->selector#openModal" data-modal-name="hourModal" data-result=format('%02d', hour)
        span = ':'
        .dw-minute.text-success.bold data-action="click->selector#openModal" data-modal-name="minuteModal" data-result=format('%02d', minute)
    = render partial: 'shared/modals/selector', locals: { id: 'hourModal', options: (1..12).to_a.map{ |i| format('%02d', i) } }
    = render partial: 'shared/modals/selector', locals: { id: 'minuteModal', options: (0..55).step(5).to_a.map{ |i| format('%02d', i) } }
    scss:
      .clock{position:relative;width:160px;height:160px;border:5px solid #333;border-radius:50%;background:#fff;display:flex}.clock .hand{position:absolute;bottom:50%;left:50%;transform-origin:bottom center;background:#333}.clock .hand.hour{width:5px;height:35px;transform:rotate(var(--angle));border-radius:4px}.clock .hand.minute{width:3px;height:50px;transform:rotate(var(--angle));border-radius:4px}.clock .numbers{position:absolute;width:100%;height:100%;top:-7px;left:-5px}.clock .number{position:absolute;top:49%;left:50%;transform:rotate(var(--angle)) translateY(-60px) rotate(calc(-1 * var(--angle)));transform-origin:center center;font-size:12px;font-weight:bold;color:#333}.clock .tick-marks{position:absolute;width:100%;height:100%;top:-4px;left:-1px}.clock .tick{position:absolute;top:50%;left:50%;transform:rotate(var(--angle)) translateY(-71px);transform-origin:center}.clock .tick--minute{width:1px;height:5px;background:#999}.clock .tick--hour{width:2px;height:8px;background:#000}
      .digital-watch{width:100px;border:1px solid #CCC;display:flex;align-self:flex-end;position:relative;bottom:-36px;justify-content:center;left:50%;transform:translate(-50%,0)}.digital-watch .dw-hour,.digital-watch .dw-minute{width:48%;font-size:18px;height:26px}.digital-watch .dw-hour{text-align:right}.digital-watch .dw-minute{text-align:left}.digital-watch>span{text-align:center;width:10px}
  TEXT
)

10.times.each do
  Question.create!(
    question_template:,
    options: {
      hour: rand(1..12),
      minute: (0..55).step(5).to_a.sample
    },
  )
end
