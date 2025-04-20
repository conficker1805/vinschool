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
  question_type: :numbers_dice,
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
      .dice{width:90px;height:90px;margin-top:30px;margin-left:30px;position:relative;transform-style:preserve-3d;transform:rotateX(-20deg) rotateY(-30deg)}.face{position:absolute;width:90px;height:90px;background:#fa6657;border:2px solid #333;box-shadow:0 2px 5px rgba(0,0,0,0.2);display:flex;justify-content:center;align-items:center;flex-wrap:wrap}.front{transform:translateZ(45px)}.top{transform:rotateX(90deg) translateZ(45px)}.right{transform:rotateY(90deg) translateZ(45px)}.dot{width:20px;height:18px;background:#333;border-radius:50%;position:absolute}.center{top:50%;left:50%;transform:translate(-50%,-50%)}.tl{top:15%;left:15%}.tr{top:15%;right:15%}.bl{bottom:15%;left:15%}.br{bottom:15%;right:15%}.ml{top:50%;left:15%;transform:translateY(-50%)}.mr{top:50%;right:15%;transform:translateY(-50%)}
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
  return 'không' if n == 0
  return 'mười' if n == 10
  return 'một trăm' if n == 100

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

# =============================================
# Khoanh tròn vật thể đứng thứ X
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :numbers,
  answer_type: :circle_answer,
  slim_content: <<~TEXT
    .title = 'Bắt đầu từ ' + @question.options['start_from']['name'] + ' hãy khoanh tròn ' + @question.options['item']['name'] + ' thứ ' + @question.options['result'].to_s
    .answers.gap-4.d-flex.mt-4
      = fa_icon @question.options['start_from']['font_awesome'], class: 'fs-1'
      - 1.upto(8).each do |idx|
        input type="checkbox" id=idx class="circle-btn d-none" data-circle-answer-target="answer" data-correct=(idx == @question.options['result'] ? 'true' : 'false' )
        label.circlable.fs-5.mb-0.d-flex.align-items-center.justify-content-center style="min-width: 45px" for=idx = fa_icon @question.options['item']['font_awesome'], class: 'fs-2 fa-regular'
  TEXT
)


(2..8).to_a.each do |i|
  start_from = [
    { name: 'người tuyết', font_awesome: 'snowman' },
    { name: 'con nhện', font_awesome: 'spider' },
    { name: 'con chó', font_awesome: 'dog' },
    { name: 'con ngựa', font_awesome: 'horse' },
    { name: 'củ cà rốt', font_awesome: 'carrot' },
  ].sample

  item = [
    { name: 'cái chuông', font_awesome: 'bell' },
    { name: 'ngôi sao', font_awesome: 'star' },
    { name: 'trái tim', font_awesome: 'heart' },
    { name: 'bàn tay', font_awesome: 'hand' },
    { name: 'bông tuyết', font_awesome: 'snowflake' },
    { name: 'mặt trăng', font_awesome: 'moon' },
    { name: 'trái banh', font_awesome: 'futbol' },
  ].sample

  Question.create!(
    question_template:,
    options: { start_from:, item:, result: i },
  )
end

# ====== Bảng số 100 =====
def generate_connected_cells(count = 10)
  grid_size = 10
  all_cells = (1..100).to_a
  path = []

  current = all_cells.sample
  path << current

  while path.size < count
    x = (current - 1) % grid_size
    y = (current - 1) / grid_size

    neighbors = []
    neighbors << current - 1 if x > 0
    neighbors << current + 1 if x < grid_size - 1
    neighbors << current - 10 if y > 0
    neighbors << current + 10 if y < grid_size - 1

    neighbors.reject! { |n| path.include?(n) || !all_cells.include?(n) }

    break if neighbors.empty?

    current = neighbors.sample
    path << current
  end

  path
end

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Dựa vào bảng số 100, hãy điền số vào ô trống
    .d-inline-grid.mt-3 style=('grid-template-columns: repeat(' + @question.options['items_per_row'].to_s + ', 50px)')
      - @question.options['matrix'].each do |i|
        - if i == @question.options['display_number']
          .square.bold.background-light-coral-red.fs-5 = @question.options['display_number']
        - elsif @question.options['selected_numbers'].include?(i)
          .square.bold.background-light-coral-red.color-coral-red.fs-5 data-action="click->selector#openModal" data-result=i data-replace="..."
        - else
          div.square.empty
    = render partial: 'shared/modals/selector', locals: { options: @question.options['matrix_answers'] }
    scss:
      .square{outline:1px solid #ccc;border:1px solid transparent}.square.empty{outline:1px solid transparent;background:transparent}
  TEXT
)

15.times do
  selected_numbers = generate_connected_cells(10)
  display_number = selected_numbers.sample

  matrix = (0...10).map { |i| (1 + i * 10..10 + i * 10).to_a }
  matrix.select! { |row| row.any? { |num| selected_numbers.include?(num) } }
  columns_to_keep = matrix[0].each_index.select do |col_index|
    matrix.any? { |row| selected_numbers.include?(row[col_index]) }
  end
  filtered_matrix = matrix.map { |row| columns_to_keep.map { |i| row[i] } }

  min = (selected_numbers.min - 10).clamp(0..)
  max = (selected_numbers.max + 10).clamp(..100)
  Question.create!(
    question_template:,
    options: {
      selected_numbers:,
      display_number:,
      items_per_row: filtered_matrix.first.count,
      matrix: filtered_matrix.flatten,
      matrix_answers: (0...10).map{ |i| (1 + i * 10..10 + i * 10).to_a }.transpose.flatten
    },
  )
end

# ====== Sơ đồ thành phần - tổng thể =====
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    - img = aws_shared_url('shared/cube_small.png')
    .title Điền số thích hợp vào sơ đồ thành phần - tổng thể
    .row
      .col-md-6
        .d-flex.gap-3.justify-content-end.align-items-center
          - @question.options['tens_size'].times do
            .tens
              - (1..10).to_a.each do |i|
                = image_tag(img, class: 'small_cube', style: 'z-index: ' + (10 - i).to_s + '; top: -' + (i * 9).to_s + 'px')
          .odd.d-grid.gap-2 style="grid-template-columns: repeat(2, 1fr);"
            - @question.options['right'].times do
              = image_tag(img, class: 'small_cube')
      .col-md-6
        .tree.mt-3 style='justify-self: flex-start'
          .node-root.color-coral-red.background-light-coral-red.bold.fs-20 data-replace='...' data-action="click->selector#openModal" data-result=@question.options['num']
          .branches
            .branch.left
              .node-child.color-coral-red.background-light-coral-red.bold.fs-20 data-replace='...' data-action="click->selector#openModal" data-result=@question.options['left']
            .branch.right
              .node-child.color-coral-red.background-light-coral-red.bold.fs-20 data-replace='...' data-action="click->selector#openModal" data-result=@question.options['right']
    = render partial: 'shared/modals/selector', locals: { options: (1..100).to_a }
    scss:
      .small_cube{height:30px}.tens{transform:translate(0,20px);max-height:250px;}.tens .small_cube{position:relative}.odd{align-self:flex-start;padding-top:10px}
      .tree{display:flex;flex-direction:column;align-items:center}.tree .node-root,.tree .node-child{width:80px;height:80px;border:2px solid #3c4a60;border-radius:50%;text-align:center;line-height:80px;background:white;position:relative;z-index:1}.tree .branches{display:flex;justify-content:space-between;width:200px;margin-top:30px}.tree .branches .branch{position:relative;width:80px;height:80px}.tree .branches .branch::before{content:"";position:absolute;top:-60px;width:2px;height:100px;background:black;z-index:0}.tree .branches .branch.left::before{left:80%;transform:rotate(35deg)}.tree .branches .branch.right::before{right:80%;transform:rotate(-35deg)}
  TEXT
)

15.times do
  num = rand(10..60)
  left = num / 10 * 10
  right = num % 10
  Question.create!(
    question_template:,
    options: { num:, left:, right:, tens_size: num / 10 },
  )
end
