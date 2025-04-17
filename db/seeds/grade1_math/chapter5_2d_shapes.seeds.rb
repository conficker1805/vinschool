puts 'Creating MATH - Chapter 4 - 2D shapes'

# === Dạng bài đếm số cạnh/góc của hình 2D
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :shapes_2d,
  answer_type: :select_answer,
  slim_content: <<~TEXT
   .title Điền vào bảng dưới đây
   table.table.table-bordered.w-100
    tr
      th Hình
      th Cạnh
      th Đỉnh
    tr
      td = image_tag(aws_shared_url(@question.options['img']), width: '170px')
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->selector#openModal" data-result=@question.options['edge'] ...
      td
        .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->selector#openModal" data-result=@question.options['vertex'] ...
    = render partial: 'shared/modals/selector', locals: { options: (0..20).to_a }
  TEXT
)

data = [
  { img: 'shared/square.png', edge: 4, vertex: 4 },
  { img: 'shared/circle.png', edge: 0, vertex: 0 },
  { img: 'shared/rectangle.png', edge: 4, vertex: 4 },
  { img: 'shared/triangle.png', edge: 3, vertex: 3 },
  { img: 'shared/pentagon.png', edge: 5, vertex: 5 },
  { img: 'shared/hexagon.png', edge: 6, vertex: 6 },
  { img: 'shared/octagon.png', edge: 8, vertex: 8 },
]

data.each do |item|
  Question.create!(
    question_template:,
    options: {
      img: item[:img],
      edge: item[:edge],
      vertex: item[:vertex],
    },
  )
end


# === Dạng bài điền tên hình 2D
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 4,
  question_type: :shapes_2d,
  answer_type: :select_answer,
  slim_content: <<~TEXT
   .title Điền tên những hình 2D vào chỗ trống
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

15.times do
  Question.create!(
    question_template:,
    options: {
      answers: ['Hình vuông', 'Hình tròn', 'Hình chữ nhật', 'Hình tam giác', 'Hình ngũ giác', 'Hình lục giác', 'Hình bát giác'],
      shapes: [
        { img: 'shared/square.png', text: 'Hình vuông' },
        { img: 'shared/circle.png', text: 'Hình tròn' },
        { img: 'shared/rectangle.png', text: 'Hình chữ nhật' },
        { img: 'shared/triangle.png', text: 'Hình tam giác' },
        { img: 'shared/pentagon.png', text: 'Hình ngũ giác' },
        { img: 'shared/hexagon.png', text: 'Hình lục giác' },
        { img: 'shared/octagon.png', text: 'Hình bát giác' },
      ].shuffle.sample(3)
    },
  )
end
