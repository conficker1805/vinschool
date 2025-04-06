puts 'Creating MATH - Chapter 5 - Scale'

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :scale,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Dựa vào cái cân bên dưới, hãy tính cân nặng của mỗi hình vuông
    .div.balance
      .arm.left
        .plate
        - unless @question.options['left_weight'].zero?
          .weight = @question.options['left_weight'].to_s + 'kg'
        .boxes
          - @question.options['left_boxes_count'].times.each do
            .box
      .center
      .arm.right
        .plate
        - unless @question.options['right_weight'].zero?
          .weight = @question.options['right_weight'].to_s + 'kg'
        .boxes
          - @question.options['right_boxes_count'].times.each do
            .box

    scss:
      .balance{display:flex;padding:0 60px;margin-top:160px}.balance .arm{width:100px;height:12px;background:#2f3e56;position:relative}.balance .arm.left{border-bottom-left-radius:20px}.balance .arm.left .plate{left:-50px}.balance .arm.right{border-bottom-right-radius:20px}.balance .arm.right .plate{right:-50px}.balance .arm .plate{width:140px;height:15px;background:#f7c245;border-top-left-radius:10px;border-top-right-radius:10px;border-bottom-left-radius:20px;border-bottom-right-radius:20px;position:absolute;top:-20px;box-shadow:inset 0 -5px 0 rgba(0,0,0,.1)}.balance .arm .plate:before{content:"";width:5px;height:6px;background-color:#2f3e56;display:block;left:50%;position:relative;transform:translate(-50%,0);top:14px}.balance .center{width:40px;height:80px;background:#2f3e56;position:relative;border-radius:0 0 10px 10px;z-index:1;display:flex;align-items:center;justify-content:center}.balance .center::after{content:"";width:20px;height:20px;background:#ccc;border-radius:50%}.weight{font-size: 14px;justify-content:center;align-items:center;display:flex;color:#fff;position:absolute;border-radius:12px;width:50px;height:40px;background-color:#2f3e56;clip-path:polygon(15% 0%,85% 0%,100% 100%,0% 100%);top:-62px}.right .weight{right:35px}.left .weight{left:-30px}.left .boxes{right:20px}.right .boxes{right:-30px}.boxes{position:absolute;top:-160px;min-height:140px;display:flex;flex-wrap:wrap;width:55px;transform:rotate(180deg);align-content:flex-start}.boxes .box{background-color:#3498db;margin:1px;width:25px;height:25px}
  TEXT
)

20.times.each do
  boxes_count = rand(1..10)
  multiplier = [1, 2, 2, 5, 5, 10].sample # Ratio of 2 and 5 are higher

  arr = [
    { text: multiplier.to_s + 'kg', correct: true },
    { text: (multiplier + 1).to_s + 'kg', correct: false },
    { text: (multiplier - 1).to_s + 'kg', correct: false },
    { text: (multiplier + 2).to_s + 'kg', correct: false },
    { text: Katex.render('\\frac{1}{' + boxes_count.to_s + '}kg'), correct: false },
  ]

  Question.create!(
    question_template:,
    options: {
      left_weight: boxes_count * multiplier,
      left_boxes_count: 0,
      right_weight: 0,
      right_boxes_count: boxes_count,
    },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

20.times.each do
  boxes_count = rand(1..10)
  multiplier = [1, 2, 2, 5, 5, 10].sample # Ratio of 2 and 5 are higher
  right_weight = rand(1..10)
  left_weight = boxes_count * multiplier + right_weight
  answers = [1, 2, 5, 10] - [multiplier]

  arr = [
    { text: multiplier.to_s + 'kg', correct: true },
    { text: answers.pop.to_s + 'kg', correct: false },
    { text: answers.pop.to_s + 'kg', correct: false },
    { text: answers.pop.to_s + 'kg', correct: false },
    { text: [3,4,6,7,8,9].sample.to_s + 'kg', correct: false },
  ]

  Question.create!(
    question_template:,
    options: {
      left_weight: left_weight,
      left_boxes_count: 0,
      right_weight: right_weight,
      right_boxes_count: boxes_count,
    },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end
