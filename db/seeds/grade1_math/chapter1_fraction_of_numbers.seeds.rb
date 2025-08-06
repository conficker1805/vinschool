puts 'Creating MATH - Chapter 1 - Fraction Of Numbers'

# === START: Dạng bài tìm giá trị phân số của 1 số (có tử số là 1)
# Ví dụ: 1/2 của 10 là bao nhiêu?
# 1/2 có nghĩa là có 2 phần và lấy 1 phần
# Vẽ 2 vòng tròn và điền cho đến khi đủ 10
# Khoanh tròn phần muốn lấy (1 phần) và đếm số lượng trong vòng tròn
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_numbers,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title Tìm kết quả của phép tính sau:
    span == @question.options['fraction']
    |  của 
    span = @question.options['quantity']
    |  = 
    span data-replace="......"
  TEXT
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 2 },
  answers_attributes: [
    { text: '1', correct: true },
    { text: '2', correct: false },
    { text: '4', correct: false },
    { text: '6', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 4 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: true },
    { text: '4', correct: false },
    { text: '8', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 6 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: true },
    { text: '6', correct: false },
    { text: '12', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 8 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '4', correct: true },
    { text: '16', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 10 },
  answers_attributes: [
    { text: '20', correct: false },
    { text: '10', correct: false },
    { text: '5', correct: true },
    { text: '2', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 12 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: false },
    { text: '6', correct: true },
    { text: '9', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 14 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: false },
    { text: '5', correct: false },
    { text: '7', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 16 },
  answers_attributes: [
    { text: '8', correct: true },
    { text: '6', correct: false },
    { text: '4', correct: false },
    { text: '2', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 18 },
  answers_attributes: [
    { text: '4', correct: false },
    { text: '8', correct: false },
    { text: '9', correct: true },
    { text: '14', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{2}'), quantity: 20 },
  answers_attributes: [
    { text: '4', correct: false },
    { text: '6', correct: false },
    { text: '8', correct: false },
    { text: '10', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 5 },
  answers_attributes: [
    { text: '1', correct: true },
    { text: '5', correct: false },
    { text: '10', correct: false },
    { text: '15', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: true },
    { text: '4', correct: false },
    { text: '15', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '0', correct: false },
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '3', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '3', correct: false },
    { text: '4', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{5}'), quantity: 25 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: false },
    { text: '4', correct: false },
    { text: '5', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{10}'), quantity: 10 },
  answers_attributes: [
    { text: '1', correct: true },
    { text: '2', correct: false },
    { text: '5', correct: false },
    { text: '10', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{1}{10}'), quantity: 20 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '2', correct: true },
    { text: '5', correct: false },
    { text: '10', correct: false },
  ],
)

# === END: Dạng bài tìm giá trị phân số của 1 số (có tử số là 1) ===

# === START: Dạng bài tìm giá trị phân số của 1 số (có tử số lớn hơn 1) ===
# Ví dụ: 2/3 của 6 là bao nhiêu?
# 2/3 có nghĩa là có 3 phần và lấy 2 phần
# Vẽ 3 vòng tròn và điền cho đến khi đủ 6
# Khoanh tròn phần muốn lấy (2 phần) và đếm số lượng trong vòng tròn

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{3}'), quantity: 6 },
  answers_attributes: [
    { text: '4', correct: true },
    { text: '5', correct: false },
    { text: '6', correct: false },
    { text: '9', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{4}'), quantity: 8 },
  answers_attributes: [
    { text: '2', correct: false },
    { text: '4', correct: false },
    { text: '6', correct: true },
    { text: '8', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: false },
    { text: '6', correct: false },
    { text: '4', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: false },
    { text: '6', correct: true },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{4}{5}'), quantity: 10 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: true },
    { text: '6', correct: false },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '10', correct: false },
    { text: '8', correct: false },
    { text: '6', correct: true },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '9', correct: true },
    { text: '6', correct: false },
    { text: '3', correct: false },
    { text: '1', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{4}{5}'), quantity: 15 },
  answers_attributes: [
    { text: '6', correct: false },
    { text: '8', correct: false },
    { text: '10', correct: false },
    { text: '12', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '6', correct: false },
    { text: '8', correct: true },
    { text: '10', correct: false },
    { text: '12', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '6', correct: false },
    { text: '8', correct: false },
    { text: '10', correct: false },
    { text: '12', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{4}{5}'), quantity: 20 },
  answers_attributes: [
    { text: '16', correct: true },
    { text: '12', correct: false },
    { text: '8', correct: false },
    { text: '4', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{10}'), quantity: 10 },
  answers_attributes: [
    { text: '8', correct: false },
    { text: '6', correct: false },
    { text: '4', correct: false },
    { text: '2', correct: true },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{10}'), quantity: 10 },
  answers_attributes: [
    { text: '3', correct: true },
    { text: '6', correct: false },
    { text: '9', correct: false },
    { text: '12', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{2}{10}'), quantity: 20 },
  answers_attributes: [
    { text: '2', correct: false },
    { text: '4', correct: true },
    { text: '8', correct: false },
    { text: '10', correct: false },
  ],
)

Question.create!(
  question_template:,
  options: { fraction: Katex.render('\\frac{3}{10}'), quantity: 20 },
  answers_attributes: [
    { text: '1', correct: false },
    { text: '3', correct: false },
    { text: '6', correct: true },
    { text: '9', correct: false },
  ],
)

# =======================================================
# 1/2 của một số là 2 vậy số đó là bao nhiêu?
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_numbers,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title
      == @question.options['fraction']
      = ' của một số là ' + @question.options['quantity'].to_s + '. Vậy số đó là bao nhiêu?'
  TEXT
)

data = [[1, 2, 1], [1, 2, 3], [1, 2, 5], [1, 2, 7], [1, 2, 9], [1, 3, 3], [1, 3, 4], [1, 4, 2], [1, 5, 2], [1, 5, 4], [1, 5, 6], [1, 5, 8], [1, 5, 10], [1, 10, 2], [1, 10, 1]]
data.each do |arr|
  numerator, denominator, quantity = arr
  fraction = Katex.render('\\frac{' + numerator.to_s + '}{' + denominator.to_s + '}')

  arr = [
    { text: quantity * denominator / numerator, correct: true },
    { text: quantity * denominator / numerator + 1, correct: false },
    { text: Katex.render('\\frac{' + quantity.to_s + '}{' + denominator.to_s + '}'), correct: false },
    { text: Katex.render('\\frac{' + denominator.to_s + '}{' + quantity.to_s + '}'), correct: false },
    { text: quantity + denominator, correct: false },
  ]

  Question.create!(
    question_template:,
    options: { fraction:, quantity: },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

# =======================================================
# 1/2 của một số là 2 vậy 1/4 của số đó là bao nhiêu?
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_numbers,
  answer_type: :single_choice,
  slim_content: <<~TEXT
    .title
      == @question.options['fraction1']
      = ' của một số là ' + @question.options['quantity'].to_s + '. Vậy '
      == @question.options['fraction2']
      |  của số đó là bao nhiêu?
  TEXT
)

data = [[1, 2, 1, 4, 2], [1, 2, 1, 4, 4], [1, 2, 1, 3, 6], [1, 2, 1, 4, 8], [1, 2, 1, 5, 5], [1, 2, 1, 5, 10], [1, 3, 1, 4, 4], [1, 4, 1, 2, 1], [1, 4, 1, 2, 2], [1, 4, 1, 3, 3], [1, 4, 1, 8, 4], [1, 5, 1, 2, 2], [1, 5, 1, 2, 4], [1, 5, 1, 4, 4]]
data.each do |arr|
  numerator1, denominator1, numerator2, denominator2, quantity = arr
  fraction1 = Katex.render('\\frac{' + numerator1.to_s + '}{' + denominator1.to_s + '}')
  fraction2 = Katex.render('\\frac{' + numerator2.to_s + '}{' + denominator2.to_s + '}')

  number = quantity * denominator1 / numerator1
  result = number / denominator2 * numerator2

  arr = [
    { text: result, correct: true },
    { text: number, correct: false },
    { text: numerator2, correct: false },
    { text: denominator1 + denominator2, correct: false },
    { text: quantity * denominator2, correct: false },
  ]

  Question.create!(
    question_template:,
    options: { fraction1:, fraction2:, quantity: },
    answers_attributes: [arr[0], *arr[1..].sample(3)].shuffle,
  )
end

# ===== Tính toán nguyên liệu =====
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :number_fraction_of_recipes,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Tìm số nguyên liệu phù hợp
    div.bold.mt-4 = @question.options['original_recipe']
    div = @question.options['original_material_1'].to_s + @question.options['unit'] + ' ' + @question.options['materials'][0]
    div = @question.options['original_material_2'].to_s + @question.options['unit'] + ' ' + @question.options['materials'][1]
    div = @question.options['original_material_3'].to_s + @question.options['unit'] + ' ' + @question.options['materials'][2]
    div = @question.options['original_material_4'].to_s + @question.options['unit'] + ' ' + @question.options['materials'][3]
    .bold.mt-2 = @question.options['target_recipe']
    - (0..3).to_a.each do |i|
      .item
        span.text-success.bold.fs-18 data-action="click->selector#openModal" data-result=@question.options['results'][i] data-replace='...'
        span = @question.options['unit'] + ' ' + @question.options['materials'][i]
    = render partial: 'shared/modals/selector', locals: { options: (0..100).to_a }
  TEXT
)

def data(origin, target)
  [
    {
      original_recipe: "Công thức để pha #{origin} ly nước ép cần:",
      target_recipe: "Hỏi cần bao nhiêu nguyên liệu để pha #{target} ly nước ép?",
      materials: ['nước cam', 'nước dứa', 'đường', 'nước cốt chanh'],
      unit: 'ml'
    },
    {
      original_recipe: "Để pha đủ màu cho #{origin} bức tranh, họa sĩ dùng:",
      target_recipe: "Hỏi cần bao nhiêu lượng mỗi màu để vẽ #{target} bức tranh?",
      materials: ['màu đỏ', 'màu vàng', 'màu xanh', 'màu trắng'],
      unit: 'ml'
    },
    {
      original_recipe: "Để làm #{origin} mô hình con vật bằng đất nặn, cần:",
      target_recipe: "Hỏi để làm #{target} mô hình, cần bao nhiêu mỗi loại?",
      materials: ['đất đỏ', 'đất xanh', 'đất trắng', 'keo dính'],
      unit: 'gam'
    },
    {
      original_recipe: "Một cô thợ may dùng nguyên liệu như sau để làm #{origin} chiếc túi:",
      target_recipe: "Hỏi cô ấy cần bao nhiêu nguyên liệu để may #{target} chiếc túi?",
      materials: ['vải chính', 'vải lót', 'dây kéo', 'ruy băng trang trí'],
      unit: 'cm'
    },
    {
      original_recipe: "Để làm #{origin} chiếc tổ chim, cần:",
      target_recipe: "Hỏi để làm #{target} chiếc tổ chim, cần bao nhiêu nguyên liệu?",
      materials: ['que gỗ nhỏ', 'cọng rơm', 'lá khô', 'hạt keo'],
      unit: ''
    },
    {
      original_recipe: "Một bộ làm #{origin} chiếc ô tô đồ chơi gồm:",
      target_recipe: "Hỏi cần bao nhiêu chi tiết để lắp #{target} chiếc ô tô?",
      materials: ['bánh xe', 'khung xe', 'cánh cửa', 'mui xe'],
      unit: ''
    },
    {
      original_recipe: "Để chuẩn bị #{origin} hộp bút chì màu, nhà máy dùng:",
      target_recipe: "Hỏi cần bao nhiêu nguyên liệu để chuẩn bị #{target} hộp bút?",
      materials: ['thân gỗ', 'ruột chì', 'vỏ màu', 'keo dán'],
      unit: 'cái'
    },
    {
      original_recipe: "Một đầu bếp cần các nguyên liệu sau để nấu #{origin} bát mì:",
      target_recipe: "Hỏi cần bao nhiêu nguyên liệu để nấu #{target} bát mì?",
      materials: ['mì sợi', 'nước dùng', 'rau cải', 'thịt bò'],
      unit: 'gam'
    },
    {
      original_recipe: "Một học sinh dùng những nguyên liệu sau để làm #{origin} chiếc đèn lồng:",
      target_recipe: "Cần bao nhiêu nguyên liệu để làm #{target} chiếc đèn lồng?",
      materials: ['giấy màu', 'keo dán', 'thanh tre', 'dây treo'],
      unit: ''
    },
    {
      original_recipe: "Để trồng #{origin} chậu cây nhỏ, cần:",
      target_recipe: "Cần bao nhiêu vật liệu để trồng #{target} chậu cây?",
      materials: ['đất trồng', 'hạt giống', 'nước tưới', 'phân bón'],
      unit: 'ml'
    }
  ]
end

# Phép chia
10.times do
  cal = [ # Dùng target là số nhỏ để các phép toán đơn giản hơn
    { table: 2, target: (1..5).to_a.sample },
    { table: 5, target: (1..3).to_a.sample },
    { table: 10, target: (1..2).to_a.sample },
  ].sample

  table = cal[:table]
  target = cal[:target]
  origin = table * target
  results = [rand(1..10), rand(1..10), rand(1..10), rand(1..10)]

  base_data = {
    results:,
    original_material_1: results[0] * table,
    original_material_2: results[1] * table,
    original_material_3: results[2] * table,
    original_material_4: results[3] * table,
  }

  Question.create!(
    question_template:,
    options: data(origin, target).sample.merge(base_data),
  )
end

# Phép nhân
10.times do
  cal = [ # Dùng target là số nhỏ để các phép toán đơn giản hơn
    { table: 1, target: [2, 2, 5, 5, 10].sample },
    { table: [2, 5, 10].sample, target: 2 },
  ].sample

  table = cal[:table]
  target = cal[:target]
  origin = table
  results = [rand(1..10) * target, rand(1..10) * target, rand(1..10) * target, rand(1..10) * target]

  base_data = {
    results:,
    original_material_1: results[0] / target,
    original_material_2: results[1] / target,
    original_material_3: results[2] / target,
    original_material_4: results[3] / target,
  }

  Question.create!(
    question_template:,
    options: data(origin, target).sample.merge(base_data),
  )
end
