puts 'Creating MATH - Chapter 1 - Venn chart'

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :venn_chart,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title.mb-0 Dựa vào biểu đồ Venn bên dưới, hãy trả lời câu hỏi
    .circle-wrapper
      .circle.circle-1
        .circle-title.bold = @question.options['left_title'].capitalize
        .circle-count = @question.options['left_num']
        .circle-empty
      .circle.circle-2
        .circle-title.bold = @question.options['right_title'].capitalize
        .circle-count = @question.options['right_num']
        .circle-empty
      .common-count = @question.options['common_num']
    .question
      span = 'Có bao nhiêu bạn ' + @question.options['positive'] + ' ' + @question.options['left_title'] + ' và ' + @question.options['right_title'] + '? '
      span.text-success.bold data-action="click->selector#openModal" data-replace="........." data-result=@question.options['results']['num1']
    .question
      span = 'Có bao nhiêu bạn ' + @question.options['negative'] + ' ' + @question.options['left_title'] + '? '
      span.text-success.bold data-action="click->selector#openModal" data-replace="........." data-result=@question.options['results']['num2']
    .question
      span = 'Có bao nhiêu bạn ' + @question.options['negative'] + ' ' + @question.options['right_title'] + '? '
      span.text-success.bold data-action="click->selector#openModal" data-replace="........." data-result=@question.options['results']['num3']
    .question
      span Có tổng cộng bao nhiêu bạn?  
      span.text-success.bold data-action="click->selector#openModal" data-replace="........." data-result=@question.options['results']['num4']
    = render partial: 'shared/modals/selector', locals: { options: (0..100).to_a }
    scss:
      .circle-wrapper{position:relative;width:290px;height:200px;.circle{width:180px;height:180px;border-radius:50%;position:absolute;top:10px;font-size:14px;text-align:center;padding:10px 0;display:flex;flex-direction:column;justify-content:space-between}.circle-1{left:0;border:1px solid black;.circle-count{text-indent:-70px}}.circle-2{left:110px;border:1px solid black;.circle-count{text-indent:70px}}.common-count{position:absolute;top:50%;left:47%}}
  TEXT
)

10.times.each do
  left_num = rand(5..40)
  right_num = rand(5..30)
  common_num = rand(5..30)
  left_title = ['nhảy', 'múa', 'bơi', 'thuyết trình'].sample
  right_title = ['hát', 'đàn', 'vẽ', 'làm thơ'].sample
  positive = 'biết'
  negative = 'không biết'

  Question.create!(
    question_template:,
    options: { left_num:, right_num:, left_title:, right_title:, positive:, negative:, common_num:, results: {
      num1: common_num,
      num2: right_num,
      num3: left_num,
      num4: left_num + right_num + common_num,
    }},
  )
end
