# ====== Sơ đồ thành phần - tổng thể =====

data = [
  { value: 1, img: 'shared/arrow-right.png' },
  { value: 1, img: 'shared/moon.png' },
  { value: 1, img: 'shared/bitten-square.png' },
  { value: 1, img: 'shared/clover.png' },
  { value: 2, img: 'shared/sign-board-1.png' },
  { value: 2, img: 'shared/arrow-left-right.png' },
  { value: 2, img: 'shared/sign-board-3.png' },
  { value: 2, img: 'shared/bookmark.png' },
  { value: 3, img: 'shared/equilateral-triangle.png' },
  { value: 3, img: 'shared/three-petal.png' },
  { value: 3, img: 'shared/mercedes-benz.png' },
  { value: 3, img: 'shared/fan-three-blades.png' },
  { value: 4, img: 'shared/plus.png' },
  { value: 4, img: 'shared/square.png' },
  { value: 4, img: 'shared/sign-board-2.png' },
  { value: 4, img: 'shared/fan-four-blades.png' },
  { value: 5, img: 'shared/star.png' },
  { value: 5, img: 'shared/five-petal.png' },
  { value: 5, img: 'shared/fan-five-blades.png' },
]

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :shape_rotation,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Hình dưới đây giống hình ban đầu bao nhiêu lần trong một vòng quay
    table.table.table-bordered.w-100
      tr
        th Hình
        th Số lần
      - @question.options['items'].each do |i|
        tr
          td = image_tag(aws_shared_url(i['img']), width: '170px')
          td
            .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 150px" data-action="click->selector#openModal" data-result=i['value'] ...
    = render partial: 'shared/modals/selector', locals: { options: (1..10).to_a }
  TEXT
)

10.times do
  Question.create!(
    question_template:,
    options: {
      items: data.sample(2)
    },
  )
end
