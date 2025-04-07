puts 'Creating MATH - Chapter 4 - Statistical Chart Quantity Comparison'

# === START: Dạng bài đếm số cạnh/góc/mặt/cạnh cong của hình 3d

# Hình hộp vuông
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
       td style="min-height: 100px"
         .wrap
           .scene
             .box
               .front
               .back
               .left
               .right
               .top
               .bottom
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['edge'] ......
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['vertex'] ......
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['face'] ......
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['curved_face'] ......
     = render partial: 'shared/modals/number_selector', locals: { options: (0..20).to_a }
     scss:
       .wrap{padding-left:20px;padding-top:10px}.scene{width:70px;height:70px;perspective:300px}.box{width:100%;height:100%;transform-style:preserve-3d;transform:rotateX(-20deg) rotateY(30deg)}.box div{position:absolute;width:70px;height:70px;border:2px solid #333;background-color:rgba(0,0,0,0.1);box-sizing:border-box}.front{transform:translateZ(35px);border:2px dashed #333}.back{transform:rotateY(180deg) translateZ(35px);border-bottom:2px dashed #333!important;border-left:2px dashed #333!important}.left{transform:rotateY(-90deg) translateZ(35px);border:2px dashed #333}.right{transform:rotateY(90deg) translateZ(35px);border-bottom:2px dashed #333!important;border-right:2px dashed #3333!important}.top{transform:rotateX(90deg) translateZ(35px);border:2px dashed #333}.bottom{transform:rotateX(-90deg) translateZ(35px);border:2px dashed #333!important}
  TEXT
)

Question.create!(
  question_template:,
  options: {
    edge: 12,
    vertex: 8,
    face: 6,
    curved_face: 0,
  },
)

#================================
# Hình hộp chữ nhật
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
       td style="min-height: 100px"
         .wrap
           .scene
             .box
               .front
               .back
               .left
               .right
               .top
               .bottom
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['edge'] ......
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['vertex'] ......
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['face'] ......
       td
         .text-success.bold.d-flex.align-items-center.justify-content-center style="height: 100px" data-action="click->number-selector#openModal" data-result=@question.options['curved_face'] ......
     = render partial: 'shared/modals/number_selector', locals: { options: (0..20).to_a }
     scss:
       .wrap{height:100px;width:150px;padding-left:20px;padding-top:10px}.scene{width:70px;height:70px;perspective:410px}.box{transform-style:preserve-3d;transform:rotateX(-20deg) rotateY(30deg);transition:transform 1s}.box div{position:absolute;border:2px solid #333;background-color:rgba(0,0,0,0.1);box-sizing:border-box}.front{width:110px;height:70px;transform:translateZ(35px);border:2px dashed #333}.back{width:110px;height:70px;transform:rotateY(180deg) translateZ(35px);border-bottom:2px dashed #333!important;border-left:2px dashed #333!important}.left{width:70px;height:70px;transform:rotateY(-90deg) translateZ(35px);border:2px dashed #333}.right{width:70px;height:70px;transform:rotateY(90deg) translateZ(75px);border-bottom:2px dashed #333!important;border-right:2px dashed #3333!important}.top{width:110px;height:70px;transform:rotateX(90deg) translateZ(35px);border:2px dashed #333}.bottom{width:110px;height:70px;transform:rotateX(-90deg) translateZ(35px);border:2px dashed #333!important}
  TEXT
)

Question.create!(
  question_template:,
  options: {
    edge: 12,
    vertex: 8,
    face: 6,
    curved_face: 0,
  },
)
