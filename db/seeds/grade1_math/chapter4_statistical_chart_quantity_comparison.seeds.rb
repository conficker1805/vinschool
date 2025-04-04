puts 'Creating MATH - Chapter 4 - Statistical Chart Quantity Comparison'

# === START: Dạng bài trả lời câu hỏi dựa vào bảng thống kê
# Giải thích: Quan sát biểu đồ và dựa vào số lượng để so sánh

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :statistical_chart_quantity_comparison,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Trả lời câu hỏi dựa vào biểu đồ dưới đây:
    table.table.table-bordered.w-100
      - max_count = @question.options['items'].max_by { |item| item['count'] }['count']
      - @question.options['items'].each do |item|
        tr
          td = item['name']
          - Array.new(max_count) { |i| i < item['count'] ? fa_icon(item['font_awesome']) : '' }.each do |icon|
            td.text-center = icon
    p = @question.options['question']
  TEXT
)

Question.create!(
  question_template:,
  options: {
    question: 'Xe tải ít hơn máy bay bao nhiêu chiếc?',
    items: [
      { count: 9, name: 'Máy bay', font_awesome: 'plane' },
      { count: 2, name: 'Xe bus', font_awesome: 'bus' },
      { count: 7, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 4, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: '11', correct: false },
    { text: '9', correct: false },
    { text: '7', correct: false },
    { text: '5', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Máy bay ít hơn xe bus bao nhiêu chiếc?',
    items: [
      { count: 2, name: 'Máy bay', font_awesome: 'plane' },
      { count: 11, name: 'Xe bus', font_awesome: 'bus' },
      { count: 8, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 4, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: '9', correct: true },
    { text: '7', correct: false },
    { text: '2', correct: false },
    { text: '5', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Xe bus ít hơn xe máy bao nhiêu chiếc?',
    items: [
      { count: 6, name: 'Máy bay', font_awesome: 'plane' },
      { count: 4, name: 'Xe bus', font_awesome: 'bus' },
      { count: 9, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 1, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: '3', correct: false },
    { text: '6', correct: false },
    { text: '5', correct: true },
    { text: '8', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Máy bay nhiều hơn xe máy bao nhiêu chiếc?',
    items: [
      { count: 9, name: 'Máy bay', font_awesome: 'plane' },
      { count: 3, name: 'Xe bus', font_awesome: 'bus' },
      { count: 7, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 5, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: '8', correct: false },
    { text: '4', correct: false },
    { text: '2', correct: true },
    { text: '5', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Xe máy nhiều hơn máy bay bao nhiêu chiếc?',
    items: [
      { count: 2, name: 'Máy bay', font_awesome: 'plane' },
      { count: 11, name: 'Xe bus', font_awesome: 'bus' },
      { count: 8, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 4, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: '9', correct: false },
    { text: '6', correct: true },
    { text: '2', correct: false },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Xe tải nhiều hơn xe bus bao nhiêu chiếc?',
    items: [
      { count: 6, name: 'Máy bay', font_awesome: 'plane' },
      { count: 4, name: 'Xe bus', font_awesome: 'bus' },
      { count: 9, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 11, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: '7', correct: true },
    { text: '9', correct: false },
    { text: '5', correct: false },
    { text: '2', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Loại phương tiện nào ít nhất?',
    items: [
      { count: 6, name: 'Máy bay', font_awesome: 'plane' },
      { count: 4, name: 'Xe bus', font_awesome: 'bus' },
      { count: 9, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 11, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: 'Xe bus', correct: true },
    { text: 'Xe máy', correct: false },
    { text: 'Xe tải', correct: false },
    { text: 'Máy bay', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Loại phương tiện nào ít nhất?',
    items: [
      { count: 6, name: 'Máy bay', font_awesome: 'plane' },
      { count: 8, name: 'Xe bus', font_awesome: 'bus' },
      { count: 9, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 5, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: 'Xe bus', correct: false },
    { text: 'Xe máy', correct: false },
    { text: 'Xe tải', correct: true },
    { text: 'Máy bay', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Loại phương tiện nào nhiều nhất?',
    items: [
      { count: 6, name: 'Máy bay', font_awesome: 'plane' },
      { count: 8, name: 'Xe bus', font_awesome: 'bus' },
      { count: 9, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 5, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: 'Xe bus', correct: false },
    { text: 'Xe máy', correct: true },
    { text: 'Xe tải', correct: false },
    { text: 'Máy bay', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: {
    question: 'Loại phương tiện nào nhiều nhất?',
    items: [
      { count: 9, name: 'Máy bay', font_awesome: 'plane' },
      { count: 8, name: 'Xe bus', font_awesome: 'bus' },
      { count: 7, name: 'Xe máy', font_awesome: 'motorcycle' },
      { count: 5, name: 'Xe tải', font_awesome: 'truck' },
    ]
  },
  answers_attributes: [
    { text: 'Xe bus', correct: false },
    { text: 'Xe máy', correct: false },
    { text: 'Xe tải', correct: false },
    { text: 'Máy bay', correct: true },
  ],
)



