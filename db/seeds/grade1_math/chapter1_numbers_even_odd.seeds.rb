puts 'Creating MATH - Chapter 1 - Numbers Even Odd'

# Khoanh tròn những số lẻ
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :numbers_even_odd,
  answer_type: :circle_answers,
  slim_content: <<~TEXT
    .title = 'Khoanh những số ' + @question.options['type'] + ' trong dãy số sau:'
    .answers.d-flex.gap-3.mt-4
      - @question.options['answers'].each_with_index do |a, idx|
        input type="checkbox" id=idx class="circle-btn d-none" data-circle-answers-target="answer" data-correct=a['correct'].to_s
        label.circlable.d-inline.fs-5.text-center style="min-width: 45px" for=idx = a['text']
  TEXT
)

# Số chẵn
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    answers = numbers.map{ |n| { text: n, correct: n.even? } }

    Question.create!(
      question_template:,
      options: { type: 'số chẵn', answers: },
    )

    break
  end
end

# Số lẻ
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    answers = numbers.map{ |n| { text: n, correct: n.odd? } }

    Question.create!(
      question_template:,
      options: { type: 'số lẻ', answers: },
    )

    break
  end
end


