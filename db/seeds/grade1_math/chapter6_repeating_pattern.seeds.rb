puts 'Creating MATH - Chapter 6 - Repeating Pattern'

# Tìm dãy hình có có quy luật
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :repeating_pattern,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Dãy hình nào sau đây là dãy có quy luật?
    - %w[A B C D].zip(@question.options['patterns']).each do |letter, pattern|
      .pattern.mb-3.d-flex.align-items-center
        span.bold.me-3.fs-5 = letter
        span
          - pattern.each do |icon_text|
            = fa_icon(icon_text, class: 'me-3 fs-2')
  TEXT
)

def generate_true_pattern(icons, max_length = 11)
  pattern = []

  loop do
    group_count = rand(2..3)
    group_repeats = Array.new(group_count) { rand(1..3) }
    pattern_length = group_repeats.sum

    next if pattern_length * 2 > max_length

    selected_icons = icons.shuffle.take(group_count)

    pattern = group_repeats.each_with_index.flat_map do |count, i|
      [selected_icons[i]] * count
    end

    break
  end

  result = pattern.cycle.take(max_length)
end

def generate_false_pattern(icons)
  correct_pattern = generate_true_pattern(icons)
  length = correct_pattern.length

  loop do
    bad = correct_pattern.dup

    case rand(3)
    when 0
      bad.shuffle! # Shuffle toàn bộ pattern (mất quy luật)
    when 1
      rand(1..2).times do
        i = rand(0...length)
        bad[i] = (icons - [bad[i]]).sample # Đổi 1-2 phần tử ngẫu nhiên
      end
    when 2
      insert_at = rand(1...(length - 1)) # Chèn 1 phần tử bất thường vào giữa
      bad.insert(insert_at, (icons - [bad[insert_at]]).sample)
      bad = bad.take(length)  # Cắt về đúng độ dài
    end

    # Kiểm tra: không giống chuỗi đúng & không phải pattern đúng
    return bad if bad != correct_pattern && !pattern_repeating?(bad)
  end
end

def pattern_repeating?(sequence)
  (1..(sequence.length / 2)).each do |size|
    pattern = sequence[0, size]
    return true if pattern.cycle.take(sequence.length) == sequence
  end
  false
end

icons = %w[star music heart shirt flag trophy lightbulb snowman fan bowling-ball bone]

20.times do
  patterns = [
    { pattern: generate_true_pattern(icons), correct: true },
    { pattern: generate_false_pattern(icons), correct: false },
    { pattern: generate_false_pattern(icons), correct: false },
    { pattern: generate_false_pattern(icons), correct: false },
  ].shuffle
  answers_attributes = %w[A B C D].zip(patterns).map { |letter, hash| { text: letter, correct: hash[:correct] } }

  Question.create!(
    question_template:,
    options: { patterns: patterns.map{ |i| i[:pattern] } },
    answers_attributes:,
  )
end
