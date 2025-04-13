puts 'Creating MATH - Chapter 5 - Clock'

def circular_add(base, increment) = ((base + increment - 1) % 12) + 1

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :clock,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    ruby:
      hour = @question.options['hour']
      minute = @question.options['minute']
      hour_angle = (hour % 12) * 30 + minute * 0.5
      minute_angle = minute * 6
      hour_string = '--angle: ' + hour_angle.to_s + 'deg'
      minute_string = '--angle: ' + minute_angle.to_s + 'deg'

    .title Đồng hồ bên dưới thể hiện mấy giờ?
    .clock
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

    scss:
      .clock{position:relative;width:160px;height:160px;border:5px solid #333;border-radius:50%;background:#fff;display:inline-block}.clock .hand{position:absolute;bottom:50%;left:50%;transform-origin:bottom center;background:#333}.clock .hand.hour{width:5px;height:35px;transform:rotate(var(--angle));border-radius:4px}.clock .hand.minute{width:3px;height:50px;transform:rotate(var(--angle));border-radius:4px}.clock .numbers{position:absolute;width:100%;height:100%;top:-7px;left:-5px}.clock .number{position:absolute;top:49%;left:50%;transform:rotate(var(--angle)) translateY(-60px) rotate(calc(-1 * var(--angle)));transform-origin:center center;font-size:12px;font-weight:bold;color:#333}.clock .tick-marks{position:absolute;width:100%;height:100%;top:-4px;left:-1px}.clock .tick{position:absolute;top:50%;left:50%;transform:rotate(var(--angle)) translateY(-71px);transform-origin:center}.clock .tick--minute{width:1px;height:5px;background:#999}.clock .tick--hour{width:2px;height:8px;background:#000}
  TEXT
)

# 12 kim giờ và kim phút cùng nhau thì đọc là 0h hay 12h?
15.times.each do
  hour = 0
  minute = 0
  arr = [
    { text: "#{format('%02d', hour)}:#{minute}", correct: true },
    { text: "#{format('%02d', circular_add(hour, -1))}:#{minute}", correct: false },
    { text: "#{format('%02d', circular_add(hour, 1))}:#{minute}", correct: false },
    { text: "#{format('%02d', hour)}:#{[minute - 5, 0].max}", correct: false },
    { text: "#{format('%02d', hour)}:#{minute + 5}", correct: false },
  ]

  Question.create!(
    question_template:,
    options: {
      hour:,
      minute:
    },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

15.times.each do
  hour = rand(0..12)
  minute = (35..55).step(5).to_a.sample
  arr = [
    { text: "#{circular_add(hour, 1)} giờ kém #{60 - minute} phút", correct: true },
    { text: "#{circular_add(hour, 1)} giờ kém #{minute / 5} phút", correct: false },
    { text: "#{circular_add(hour, 1)} giờ #{60 - minute} phút", correct: false },
    { text: "#{circular_add(hour, -1)} giờ #{minute} phút", correct: false },
    { text: "#{hour} giờ kém #{60 - minute} phút", correct: false },
    { text: "#{hour} giờ kém #{60 - minute + 5} phút", correct: false },
  ]

  Question.create!(
    question_template:,
    options: {
      hour:,
      minute:
    },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end
