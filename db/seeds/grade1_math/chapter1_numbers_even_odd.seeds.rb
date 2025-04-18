puts 'Creating MATH - Chapter 1 - Numbers Even Odd'

# Khoanh tròn những số lẻ
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :numbers_even_odd,
  answer_type: :circle_answers,
  slim_content: <<~TEXT
    .title = 'Khoanh tròn những số ' + @question.options['type'] + ' trong dãy số sau:'
    .answers.d-flex.gap-3.mt-4
      - @question.options['answers'].each_with_index do |a, idx|
        input type="checkbox" id=idx class="circle-btn d-none" data-circle-answers-target="answer" data-correct=a['correct'].to_s
        label.circlable.d-inline.fs-5.text-center style="min-width: 45px" for=idx = a['text']
  TEXT
)

# === Khoanh tròn những số chẵn
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    answers = numbers.map{ |n| { text: n, correct: n.even? } }

    Question.create!(
      question_template:,
      options: { type: 'chẵn', answers: },
    )

    break
  end
end

# === Khoanh tròn những số lẻ
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    answers = numbers.map{ |n| { text: n, correct: n.odd? } }

    Question.create!(
      question_template:,
      options: { type: 'lẻ', answers: },
    )

    break
  end
end

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :numbers_even_odd,
  answer_type: :circle_answer,
  slim_content: <<~TEXT
    .title = 'Khoanh tròn số ' + @question.options['type'] + ' ' + @question.options['value'] + ' trong dãy số sau:'
    .answers.d-flex.gap-3.mt-4
      - @question.options['answers'].each_with_index do |a, idx|
        input type="checkbox" id=idx class="circle-btn d-none" data-circle-answer-target="answer" data-correct=a['correct'].to_s
        label.circlable.d-inline.fs-5.text-center style="min-width: 45px" for=idx = a['text']
  TEXT
)

# === Khoanh tròn số lẻ lớn nhất
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    result = numbers.select(&:odd?).max
    answers = numbers.map{ |n| { text: n, correct: n == result } }

    Question.create!(
      question_template:,
      options: { type: 'lẻ', value: 'lớn nhất', answers: },
    )

    break
  end
end

# === Khoanh tròn số lẻ nhỏ nhất
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    result = numbers.select(&:odd?).min
    answers = numbers.map{ |n| { text: n, correct: n == result } }

    Question.create!(
      question_template:,
      options: { type: 'lẻ', value: 'nhỏ nhất', answers: },
    )

    break
  end
end

# === Khoanh tròn số chẵn lớn nhất
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    result = numbers.select(&:even?).max
    answers = numbers.map{ |n| { text: n, correct: n == result } }

    Question.create!(
      question_template:,
      options: { type: 'lẻ', value: 'lớn nhất', answers: },
    )

    break
  end
end

# === Khoanh tròn số chẵn nhỏ nhất
5.times do
  loop do
    numbers = (0..100).to_a.shuffle.first(10)

    next if numbers.all?(&:even?) || numbers.all?(&:odd?)

    result = numbers.select(&:even?).min
    answers = numbers.map{ |n| { text: n, correct: n == result } }

    Question.create!(
      question_template:,
      options: { type: 'lẻ', value: 'nhỏ nhất', answers: },
    )

    break
  end
end

# TODO: Khoanh tròn 2/3 số lẻ/chẵn nhỏ/lớn nhất

