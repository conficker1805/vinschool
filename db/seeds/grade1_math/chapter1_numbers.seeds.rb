puts 'Creating MATH - Chapter 1 - Numbers'

# Điền số vào ô trống
# 26 = []0 + []
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Điền số còn thiếu vào chỗ trống
    .d-flex.align-items-center
      .square.border-end-0 = @question.options['numbers']['num1']
      .square = @question.options['numbers']['num2']
      span.bold.mx-3.fs-5 = '='
      .square.border-end-0.text-success.bold data-action="click->selector#openModal" data-result=@question.options['results']['num1']
      .square = @question.options['numbers']['num3']
      span.bold.mx-3.fs-5 +
      .square.text-success.bold data-action="click->selector#openModal" data-result=@question.options['results']['num2']
    = render partial: 'shared/modals/selector', locals: { options: (0..9).to_a }
  TEXT
)

10.times.each do
  random = rand(11..99)
  num1 = random / 10
  num2 = random % 10

  Question.create!(
    question_template:,
    options: {
      numbers: { num1:, num2:, num3: 0 },
      results: { num1:, num2: },
    },
  )
end

# =============================================
# Tính tổng số chấm trên 3 mặt của cục xúc xắc
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :number_dice,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Viết số tương ứng với tổng số chấm trên ba mặt của con xúc xắc
    ruby:
      dot_positions = {1 => [:center], 2 => [:tl, :br], 3 => [:tl, :center, :br], 4 => [:tl, :tr, :bl, :br], 5 => [:tl, :tr, :bl, :br, :center], 6 => [:tl, :tr, :ml, :mr, :bl, :br] }
      face_values = { front: @question.options['num1'], top: @question.options['num2'], right: @question.options['num3'] }
    .dice
      - face_values.each do |face, value|
        .face class=face
          - dot_positions[value].each do |pos|
            .dot class=pos
    scss:
      .dice{width:90px;height:90px;margin-top:30px;margin-left:30px;position:relative;transform-style:preserve-3d;transform:rotateX(-20deg) rotateY(-30deg)}.face{position:absolute;width:90px;height:90px;background:#fff;border:2px solid #333;box-shadow:0 2px 5px rgba(0,0,0,.2);display:flex;justify-content:center;align-items:center;flex-wrap:wrap}.front{transform:translateZ(45px)}.top{transform:rotateX(90deg) translateZ(45px)}.right{transform:rotateY(90deg) translateZ(45px)}.dot{width:13px;height:13px;background:#333;border-radius:50%;position:absolute}.center{top:50%;left:50%;transform:translate(-50%,-50%)}.tl{top:25%;left:25%}.tr{top:25%;right:25%}.bl{bottom:25%;left:25%}.br{bottom:25%;right:25%}.ml{top:50%;left:25%;transform:translateY(-50%)}.mr{top:50%;right:25%;transform:translateY(-50%)}
  TEXT
)

10.times.each do
  numbers = (1..6).to_a.shuffle
  num1, num2, num3 = numbers.first(3)
  result = num1 + num2 + num3

  arr = [
    { text: result, correct: true },
    { text: result + 1, correct: false },
    { text: result + 2, correct: false },
    { text: result - 1, correct: false },
    { text: result - 2, correct: false },
  ]

  Question.create!(
    question_template:,
    options: { num1:, num2:, num3: },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

# =============================================
# Viết số sau dưới dạng chữ

def read_number(n)
  return "không" if n == 0
  return "một trăm" if n == 100

  units = %w[không một hai ba bốn năm sáu bảy tám chín]
  tens  = [nil, "mười", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín"]

  if n < 10
    units[n]
  elsif n < 20
    return "mười lăm" if n == 15
    return "mười bốn" if n == 14
    "mười #{units[n % 10]}"
  else
    t, u = n.divmod(10)
    str = "#{tens[t]} mươi"
    return str if u == 0
    str + " " + (u == 1 ? "mốt" : u == 4 ? "tư" : u == 5 ? "lăm" : units[u])
  end
end

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :number_as_text,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Viết số sau dưới dạng chữ
    span = @question.options['num'].to_s + ': '
    span data-replace="..................."
  TEXT
)

# Tăng tỉ lệ xuất hiện của các số kết thúc bằng 4 và 5
candidates = (2..9).to_a.map { |i| 4 + i * 10 } + (2..9).to_a.map { |i| 5 + i * 10 }
candidates += (1..4).to_a.map { rand(10..100) }
num = candidates.sample

10.times.each do
  result = read_number(num).capitalize
  exception = num > 20 && (num % 10 == 4 || num % 10 == 5)

  Question.create!(
    question_template:,
    options: { num: },
    answers_attributes: [
      { text: result, correct: true },
      { text: num.to_s.split('').uniq.size == 1 ? result.split[0..-2].join(' ') : read_number(num.to_s.reverse.to_i).capitalize, correct: false },
      { text: (num >= 20 ? result.gsub('mươi ', '') : read_number(num + 10).capitalize), correct: false },
      { text: (exception ? result.gsub('lăm', 'năm').gsub('tư', 'bốn') : read_number(num - 10).capitalize), correct: false },
    ].shuffle,
  )
end
