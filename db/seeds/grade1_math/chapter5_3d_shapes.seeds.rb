puts 'Creating MATH - Chapter 4 - Statistical Chart Quantity Comparison'

# === Dạng bài đếm số cạnh/góc/mặt/cạnh cong của hình 3d
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :shapes_3d,
  answer_type: :select_answer,
  slim_content: <<~TEXT
   .title Điền vào bảng dưới đây
   table.table.table-bordered.w-100
    tr
      th Hình
      th Cạnh
      th Đỉnh
      th Mặt
      th Bề mặt cong
    tr
      td
        = image_tag(aws_public_url(@question.options['img']), width: '170px')
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->number-selector#openModal" data-result=@question.options['edge'] ...
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->number-selector#openModal" data-result=@question.options['vertex'] ...
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->number-selector#openModal" data-result=@question.options['face'] ...
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->number-selector#openModal" data-result=@question.options['curved_face'] ...
    = render partial: 'shared/modals/number_selector', locals: { options: (0..20).to_a }
  TEXT
)

# Hình cầu
Question.create!(
  question_template:,
  options: {
    img: 'ball.png',
    edge: 0,
    vertex: 0,
    face: 0,
    curved_face: 1,
  },
)

# Hình chóp
Question.create!(
  question_template:,
  options: {
    img: 'pyramid.png',
    edge: 8,
    vertex: 5,
    face: 5,
    curved_face: 0,
  },
)

# Hình hộp vuông
Question.create!(
  question_template:,
  options: {
    img: 'cuboid.png',
    edge: 12,
    vertex: 8,
    face: 6,
    curved_face: 0,
  },
)

# Hình hộp chữ nhật
Question.create!(
  question_template:,
  options: {
    img: 'cube.png',
    edge: 12,
    vertex: 8,
    face: 6,
    curved_face: 0,
  },
)

# Hình trụ
Question.create!(
  question_template:,
  options: {
    img: 'cylinder.png',
    edge: 0,
    vertex: 0,
    face: 2,
    curved_face: 1,
  },
)
