puts 'Creating MATH - Chapter 4 - Money Calculation'

# === START: Dạng bài tính toán tiền USD và Cent

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :money_calculation,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    div.title
      = @question.options['name']
      |  có 
      = @question.options['total']
      | . 
      = @question.options['name']
      |  đã chi 
      = @question.options['spent_usd']
      |  và 
      = @question.options['spent_cent']
      |  để mua bánh. Vậy bạn còn lại số tiền là bao nhiêu?

    div.mt-3
      span Số tiền còn lại là: 
      span data-replace="............."
  TEXT
)

15.times.each do
  total = rand(20..100)
  spent_usd = rand(2..(total-1))
  spent_cent = rand(1..99)

  Question.create!(
    question_template:,
    options: {
      name: Faker::Name.female_first_name,
      total: "$#{total}",
      spent_usd: "$#{spent_usd}",
      spent_cent: "#{spent_cent}c"
    },
    answers_attributes: [
      { text: "#{total - spent_usd}$ và #{100 - spent_cent}c", correct: false },
      { text: "#{100 - spent_cent}c", correct: false },
      { text: "#{total - spent_usd - 1}$ và #{100 - spent_cent}c", correct: true },
      { text: "#{total - spent_usd - 1}$", correct: false },
    ],
  )
end
