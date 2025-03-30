puts 'Creating MATH - Chapter 1'
# === START: Dạng bài chuyển phép cộng thành phép nhân
  # Ví dụ: 2 + 2 + 2 = 15 -----> 2 x 3 = 15
  # Giải thích: Quan sát thấy số 2 lặp lại 3 lần => 2 x 3 = 15, ghi lại kết quả

  question_template = QuestionTemplate.create!(
    grade: 1,
    subject: :math,
    chapter: 1,
    question_type: :repeated_addition,
    answer_type: :single_choice,
    slim_content: <<~TEXT
      h4.title Viết phép tính tương ứng vào chỗ trống
      table.table.table-bordered.w-100
        tr
          th Phép cộng
          th Phép nhân
        tr
          td = @question.options['addition']
          td data-replace="...................."
    TEXT
  )

  Question.create!(
    question_template:,
    options: { addition: '2 + 2 = 4' },
    answers_attributes: [
      { text: '2 x 2 = 4', correct: true },
      { text: '4 : 2 = 2', correct: false },
      { text: '2 x 4 = 8', correct: false },
      { text: '2 x 2 = 2', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '2 + 2 + 2 = 6' },
    answers_attributes: [
      { text: '2 x 3 = 9', correct: false },
      { text: '6 : 2 = 3', correct: false },
      { text: '2 x 3 = 6', correct: true },
      { text: '3 x 3 = 9', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '2 + 2 + 2 + 2 = 8' },
    answers_attributes: [
      { text: '8 : 4 = 2', correct: false },
      { text: '8 : 2 = 4', correct: false },
      { text: '2 x 3 = 8', correct: false },
      { text: '2 x 4 = 8', correct: true },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '5 + 5 = 10' },
    answers_attributes: [
      { text: '5 x 5 = 25', correct: false },
      { text: '5 x 2 = 10', correct: true },
      { text: '10 : 5 = 2', correct: false },
      { text: '10 : 2 = 5', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '5 + 5 + 5 = 15' },
    answers_attributes: [
      { text: '5 x 3 = 25', correct: false },
      { text: '5 x 5 = 25', correct: false },
      { text: '15 : 5 = 3', correct: false },
      { text: '5 x 3 = 15', correct: true },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '5 + 5 + 5 + 5 = 20' },
    answers_attributes: [
      { text: '5 x 4 = 20', correct: true },
      { text: '5 x 4 = 25', correct: false },
      { text: '5 x 3 = 15', correct: false },
      { text: '20 : 5 = 4', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '10 + 10 = 20' },
    answers_attributes: [
      { text: '10 x 2 = 200', correct: false },
      { text: '10 x 2 = 4', correct: false },
      { text: '10 x 2 = 20', correct: true },
      { text: '20 : 2 = 10', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '10 + 10 + 10 = 30' },
    answers_attributes: [
      { text: '10 x 3 = 30', correct: true },
      { text: '10 x 3 = 6', correct: false },
      { text: '10 x 3 = 300', correct: false },
      { text: '30 : 3 = 10', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '10 + 10 + 10 + 10 = 40' },
    answers_attributes: [
      { text: '10 + 4 = 40', correct: false },
      { text: '10 : 4 = 40', correct: false },
      { text: '10 x 4 = 400', correct: false },
      { text: '10 x 4 = 40', correct: true },
    ],
  )
  # === END: Dạng bài chuyển phép cộng thành phép nhân

# === START: Dạng bài chuyển phép nhân thành phép cộng
  # Ví dụ: 2 x 3 = 15 -----> 2 + 2 + 2 = 15
  # Giải thích: Số 2 lặp lại 3 lần => 2 + 2 + 2, ghi lại kết quả

  question_template = QuestionTemplate.create!(
    grade: 1,
    subject: :math,
    chapter: 1,
    question_type: :breakdown_multiplication,
    answer_type: :single_choice,
    slim_content: <<~TEXT
      h4.title Viết phép tính tương ứng vào chỗ trống
      table.table.table-bordered.w-100
        tr
          th Phép nhân
          th Phép cộng
        tr
          td = @question.options['addition']
          td data-replace="...................."
    TEXT
  )

  Question.create!(
    question_template:,
    options: { addition: '2 x 2 = 4' },
    answers_attributes: [
      { text: '2 + 2 = 4', correct: true },
      { text: '1 + 1 + 1 + 1 = 4', correct: false },
      { text: '3 + 1 = 4', correct: false },
      { text: '2 + 2 + 2 = 4', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '2 x 3 = 6' },
    answers_attributes: [
      { text: '2 + 2 + 2 = 4', correct: false },
      { text: '6 : 2 = 3', correct: false },
      { text: '2 + 2 + 2 = 6', correct: true },
      { text: '2 x 3 = 6', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '2 x 4 = 8' },
    answers_attributes: [
      { text: '8 : 4 = 2', correct: false },
      { text: '8 : 2 = 4', correct: false },
      { text: '2 + 2 + 2 = 8', correct: false },
      { text: '2 + 2 + 2 + 2 = 8', correct: true },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '5 x 2 = 10' },
    answers_attributes: [
      { text: '5 + 2 = 10', correct: false },
      { text: '5 + 5 = 10', correct: true },
      { text: '10 : 5 = 2', correct: false },
      { text: '5 + 5 = 25', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '5 x 3 = 15' },
    answers_attributes: [
      { text: '5 + 3 = 15', correct: false },
      { text: '5 + 5 = 15', correct: false },
      { text: '15 : 5 = 3', correct: false },
      { text: '5 + 5 + 5 = 15', correct: true },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '5 x 4 = 20' },
    answers_attributes: [
      { text: '5 + 5 + 5 + 5 = 20', correct: true },
      { text: '5 + 5 + 5 = 20', correct: false },
      { text: '5 + 5 + 5 + 5 = 15', correct: false },
      { text: '20 : 5 = 4', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '10 x 2 = 20' },
    answers_attributes: [
      { text: '10 + 10 = 200', correct: false },
      { text: '10 + 10 = 100', correct: false },
      { text: '10 + 10 = 20', correct: true },
      { text: '10 + 10 + 10 = 20', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '10 x 3 = 30' },
    answers_attributes: [
      { text: '10 + 10 + 10 = 30', correct: true },
      { text: '10 + 3 = 30', correct: false },
      { text: '10 + 10 = 30', correct: false },
      { text: '10 + 10 + 10 = 300', correct: false },
    ],
  )

  Question.create!(
    question_template:,
    options: { addition: '10 x 4 = 40' },
    answers_attributes: [
      { text: '10 + 4 = 40', correct: false },
      { text: '40 : 10 = 4', correct: false },
      { text: '10 + 10 + 10 = 40', correct: false },
      { text: '10 + 10 + 10 + 10 = 40', correct: true },
    ],
  )
  # === END: Dạng bài chuyển phép nhân thành phép cộng

# === START: Dạng bài tìm giá trị phân số của 1 số (có tử số là 1)
  # Ví dụ: 1/2 của 10 là bao nhiêu?
  # 1/2 có nghĩa là có 2 phần và lấy 1 phần
  # Vẽ 2 vòng tròn và điền cho đến khi đủ 10
  # Khoanh tròn phần muốn lấy (1 phần) và đếm số lượng trong vòng tròn
  question_template = QuestionTemplate.create!(
    grade: 1,
    subject: :math,
    chapter: 1,
    question_type: :choice,
    answer_type: :single_choice,
    slim_content: <<~TEXT
      h4.title Tìm kết quả của phép tính sau:
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
      { text: '4', correct: true },
      { text: '8', correct: false },
      { text: '9', correct: false },
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
      { text: '4', correct: true },
      { text: '5', correct: false },
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

  # === END: Dạng bài tìm giá trị phân số của 1 số (có tử số lớn hơn 1) ===
