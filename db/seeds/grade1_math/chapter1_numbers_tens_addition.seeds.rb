# Cho phép cộng: 3 + 7 = 10
# Hãy viết 2 phép cộng cho: [] + [] = 20
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :numbers_tens_addition,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title = 'Dựa vào phép tính ' + @question.options['calculation'] + ' , hãy hoàn thành hai phép cộng sau:'
    .row.result data-result=@question.options['results']
      .calculation.col-md-6
        span.text-success.bold data-action="click->selector#openModal" data-replace="..." data-result='false'
        span = ' + '
        span.text-success.bold data-action="click->selector#openModal" data-replace="..." data-result='false'
        span = ' = ' + @question.options['num3'].to_s
      .calculation.col-md-6
        span.text-success.bold data-action="click->selector#openModal" data-replace="..." data-result='false'
        span = ' + '
        span.text-success.bold data-action="click->selector#openModal" data-replace="..." data-result='false'
        span = ' = ' + @question.options['num3'].to_s
    = render partial: 'shared/modals/selector', locals: { options: (0..100).to_a }
    javascript:
      window.prepareResult = function() {
        const results = JSON.parse(document.querySelector('.result').dataset.result).sort()
        const userResults = Array.from(document.querySelectorAll('.calculation')).map(elm => elm.textContent ).sort();
        if (results.every((v, i) => v === userResults[i]))
          document.querySelectorAll('[data-result]').forEach(elm => elm.setAttribute('data-result', elm.textContent))
      }
  TEXT
)

[1, 2, 3, 4].each do |num1|
  num2 = 10 - num1
  num3 = 20
  Question.create!(
    question_template:,
    options: {
      num3:,
      calculation: "#{num1} + #{num2} = #{num1 + num2}",
      results: [
        "#{num1 + 10} + #{num2} = #{num3}",
        "#{num2 + 10} + #{num1} = #{num3}"
      ]
    },
  )
end
