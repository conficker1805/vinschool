puts 'Creating MATH - Chapter 4 - 3D shapes'

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
      td = image_tag(aws_shared_url(@question.options['img']), width: '170px')
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->selector#openModal" data-result=@question.options['edge'] ...
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->selector#openModal" data-result=@question.options['vertex'] ...
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->selector#openModal" data-result=@question.options['face'] ...
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->selector#openModal" data-result=@question.options['curved_face'] ...
    = render partial: 'shared/modals/selector', locals: { options: (0..20).to_a }
  TEXT
)

data = [
  { img: 'shared/ball.png', edge: 0, vertex: 0, face: 0, curved_face: 1 },
  { img: 'shared/pyramid.png', edge: 8, vertex: 5, face: 5, curved_face: 0 },
  { img: 'shared/cuboid.png', edge: 12, vertex: 8, face: 6, curved_face: 0 },
  { img: 'shared/cube.png', edge: 12, vertex: 8, face: 6, curved_face: 0 },
  { img: 'shared/cylinder.png', edge: 0, vertex: 0, face: 2, curved_face: 1 },
]

data.each do |item|
  Question.create!(
    question_template:,
    options: {
      img: item[:img],
      edge: item[:edge],
      vertex: item[:vertex],
      face: item[:face],
      curved_face: item[:curved_face],
    },
  )
end

# === Dạng bài điền tên hình 3D
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :shapes_3d,
  answer_type: :select_answer,
  slim_content: <<~TEXT
   .title Điền tên những hình 3D vào chỗ trống
   table.table.table-bordered.w-100
     tr
       - @question.options['shapes'].each do |shape|
         td
           .d-flex.flex-column.align-items-center
             = image_tag(aws_shared_url(shape['img']), width: '150px')
             .text-success.bold.d-flex.align-items-center.justify-content-center data-action="click->selector#openModal" data-result=shape['text'] ........
     = render partial: 'shared/modals/selector', locals: { options: @question.options['answers'] }
  TEXT
)

5.times do
  Question.create!(
    question_template:,
    options: {
      answers: ['Hình chóp', 'Hình trụ', 'Hình cầu', 'Hình hộp', 'Hình hộp chữ nhật'],
      shapes: [
        { img: 'shared/pyramid.png', text: 'Hình chóp' },
        { img: 'shared/cylinder.png', text: 'Hình trụ' },
        { img: 'shared/ball.png', text: 'Hình cầu' },
        { img: 'shared/cube.png', text: 'Hình hộp' },
        { img: 'shared/cuboid.png', text: 'Hình hộp chữ nhật' },
      ].shuffle.sample(3)
    },
  )
end


