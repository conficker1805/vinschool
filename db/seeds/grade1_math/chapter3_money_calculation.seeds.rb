puts 'Creating MATH - Chapter 4 - Money Calculation'

# === Dạng bài tính toán tiền USD và Cent
# Ví dụ: Lina có $90. Lina đã chi $21 và 92c để mua bánh. Vậy bạn còn lại số tiền là bao nhiêu?
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :money_calculation,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title
      = @question.options['name'] + ' có ' + @question.options['total'] + '. '
      = @question.options['name'] + ' đã chi ' + @question.options['spent_usd'] + ' và ' + @question.options['spent_cent'] + ' để mua bánh. '
      = 'Vậy ' + @question.options['name'] + ' còn lại số tiền là bao nhiêu?'
    div.mt-3
      span Số tiền còn lại là: 
      span.bold data-replace="............."
  TEXT
)

15.times.each do
  total = rand(20..100)
  spent_usd = rand(2..(total-1))
  spent_cent = rand(1..99)

  arr = [
    { text: "$#{total - spent_usd - 1} và #{100 - spent_cent}c", correct: true },
    { text: "$#{total - spent_usd} và #{100 - spent_cent}c", correct: false },
    { text: "$#{total - spent_usd - 1} và #{100 - spent_cent + 10}c", correct: false },
    { text: "$#{total - spent_usd + 1} và #{100 - spent_cent}c", correct: false },
    { text: "#{100 - spent_cent}c", correct: false },
    { text: "$#{total - spent_usd - 1}", correct: false },
  ]

  Question.create!(
    question_template:,
    options: {
      name: Faker::Name.female_first_name,
      total: "$#{total}",
      spent_usd: "$#{spent_usd}",
      spent_cent: "#{spent_cent}c"
    },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

# === Dạng bài tính tiền có thể mua được những món hàng nào
# Ví dụ: Cho các loại tiền mệnh giá X, Y, Z, hỏi có thể mua được những loại nào

money_pool = {
  '1_cent' => 0.01,
  '5_cents' => 0.05,
  '10_cents' => 0.10,
  '25_cents' => 0.25,
  '50_cents' => 0.50,
  '1_dollar' => 1.00,
  '10_dollars' => 10.00,
  '50_dollars' => 50.00,
  '100_dollars' => 100.00
}

def us_money_to_words(amount)
  dollars = amount.to_i
  cents = ((amount - dollars) * 100).round

  words = []
  words << "$#{dollars}" if dollars > 0
  if cents > 0
    words << "#{cents} #{'cent'.pluralize(cents)}"
  end

  words.join(' và ')
end

def generate_fake_answers(amount)
  correct_dollars = amount.to_i
  correct_cents = ((amount - correct_dollars) * 100).round

  distractors = Set.new

  while distractors.size < 3
    fake_dollars = [correct_dollars - 10, correct_dollars + 10, correct_dollars - 5, correct_dollars + 5, correct_dollars + rand(-5..5)].sample.clamp(0, nil)
    fake_cents = [correct_cents - 1, correct_cents + 1, correct_cents - 25, correct_cents + 25, correct_cents + 20, correct_cents - 20, rand(0..99)].sample.clamp(0, 99)
    fake_value = fake_dollars + fake_cents / 100.0

    next if fake_value.round(2) == amount.round(2) # Tránh trùng với đáp án đúng

    distractors.add(us_money_to_words(fake_value.round(2)))
  end

  distractors.to_a
end

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :money_calculation,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title
      = @question.options['name'] + ' có những loại tiền sau:'
    .money.d-flex.gap-1.flex-wrap
      - @question.options['money_list'].each do |k, v|
        = image_tag(aws_shared_url('shared/' + k + '.png'), style: 'max-height: 100px')
    .mt-3
      span = 'Vậy ' + @question.options['name'] + ' có tổng cộng: '
      span.bold.text-success data-replace="............."
  TEXT
)

15.times.each do
  money_list = money_pool.to_a.sample(rand(2..3)).to_h
  money_value = money_list.values.sum

  answers_attributes = [
    { text: us_money_to_words(money_value), correct: true },
    *generate_fake_answers(money_value).map{ |text| { text:, correct: false } }
  ].shuffle

  Question.create!(
    question_template:,
    options: { name: Faker::Name.female_first_name, money_list: },
    answers_attributes:,
  )
end

# Dạng bài cho 1 số mệnh giá tiền và phải đổi ra cents
money_pool = {
  '1_cent' => 0.01,
  '5_cents' => 0.05,
  '10_cents' => 0.10,
  '25_cents' => 0.25,
  '50_cents' => 0.50,
  '1_dollar' => 1.00,
}

10.times.each do
  money_list = money_pool.to_a.sample(rand(2..4)).to_h
  money_in_cents = (money_list.values.sum.round(2) * 100).to_i

  arr = [
    { text: money_in_cents.to_s + ' cents', correct: true },
    { text: (money_in_cents + 5).to_s + ' cents', correct: false },
    { text: (money_in_cents - 5).to_s + ' cents', correct: false },
    { text: (money_in_cents - 25).to_s + ' cents', correct: false },
    { text: (money_in_cents + 25).to_s + ' cents', correct: false },
    { text: (money_in_cents + 50).to_s + ' cents', correct: false },
  ]

  Question.create!(
    question_template:,
    options: { name: Faker::Name.female_first_name, money_list: },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end
