# ====== Sơ đồ thành phần - tổng thể =====

data = [
  { value: 1, img: 'shared/arrow-right.png' },
  { value: 1, img: 'shared/moon.png' },
  { value: 1, img: 'shared/bitten-square.png' },
  { value: 1, img: 'shared/clover.png' },
  { value: 1, img: 'shared/bookmark.png' },
  { value: 2, img: 'shared/sign-board-1.png' },
  { value: 2, img: 'shared/arrow-left-right.png' },
  { value: 2, img: 'shared/sign-board-3.png' },
  { value: 2, img: 'shared/two-opposite-triangles.png' },
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

# =====
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :shape_rotation,
  answer_type: :circle_answer,
  slim_content: <<~TEXT
    .title Khoanh tròn đáp án đúng bên dưới
    .row
      .col-md-4
        .d-flex.flex-column.align-items-center.border.border-dark.py-3
          = image_tag(aws_shared_url(@question.options['img']), width: '100px')
      .col-md-8
        p.bold = 'Khi quay hình ' + @question.options['text'] + ' ta sẽ có hình nào?'
    .row.mt-4
      - ('A'..'D').to_a.zip([0, 90, 180, 270].shuffle).each do |text, deg|
        .col-md-3
          .d-flex.flex-column-reverse.align-items-center
            input type="checkbox" id=deg class="circle-btn d-none" data-circle-answer-target="answer" data-correct=(@question.options['deg'] == deg ? 'true' : 'false')
            label.circlable.bold.fs-22 for=deg style='min-width: 47px' = text
            label for=deg
              = image_tag(aws_shared_url(@question.options['img']), width: '100px', style: 'transform: rotate(' + deg.to_s + 'deg)')
  TEXT
)

10.times do
  images = [
    { img: 'shared/arrow-right.png' },
    { img: 'shared/moon.png' },
    { img: 'shared/bitten-square.png' },
    { img: 'shared/clover.png' },
    { img: 'shared/bookmark.png' },
    { img: 'shared/circle-one-fourths.png' },
    { img: 'shared/circle-three-fourths.png' },
    { img: 'shared/heart.png' },
    { img: 'shared/clubs.png' },
    { img: 'shared/fork.png' },
  ]

  data = [
    { deg: 0, text: 'một vòng theo chiều kim đồng hồ' },
    { deg: 0, text: 'một vòng ngược chiều kim đồng hồ' },
    { deg: 90, text: 'một phần tư vòng theo chiều kim đồng hồ' },
    { deg: 270, text: 'một phần tư vòng ngược chiều kim đồng hồ' },
    { deg: 180, text: 'nửa vòng theo chiều kim đồng hồ' },
    # Duplicate to make ratio of 90, 270, 180 higher
    { deg: 90, text: 'một phần tư vòng theo chiều kim đồng hồ' },
    { deg: 270, text: 'một phần tư vòng ngược chiều kim đồng hồ' },
    { deg: 180, text: 'nửa vòng theo chiều kim đồng hồ' },
    { deg: 90, text: 'một phần tư vòng theo chiều kim đồng hồ' },
    { deg: 270, text: 'một phần tư vòng ngược chiều kim đồng hồ' },
    { deg: 180, text: 'nửa vòng theo chiều kim đồng hồ' },
  ]

  Question.create!(
    question_template:,
    options: images.sample.merge(data.sample)
  )
end
