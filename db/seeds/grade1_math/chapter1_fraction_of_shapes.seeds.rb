puts 'Creating MATH - Chapter 1 - Fraction of Shapes'

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_shapes,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Viết phân số tương ứng với phần được tô màu:
    .row.results data-results=@question.options['results']
      .col-md-8
        .rectangle style=@question.options['style']
          - 1.upto(@question.options['denominator']) do |i|
            .part class=@question.options['rules'].fetch(i.to_s, '')
      .col-md-4
        .fraction.d-inline-flex.flex-column
          .numerator.text-center.text-success.fs-3.px-1.border-bottom.border-black data-action="click->selector#openModal" data-replace='...' data-result=@question.options['numerator']
          .denominator.text-center.text-success.fs-3.px-1 data-action="click->selector#openModal" data-replace='...' data-result=@question.options['denominator']
    = render partial: 'shared/modals/selector', locals: { options: (1..10).to_a }
    scss:
      .rectangle{display:grid;border:3px solid #cc5432;gap:3px;background-color:#cc5432}.rectangle .part{background-color:#fffbf3}.rectangle .part.slash{background-image:repeating-linear-gradient(45deg,#fc6a54,#fc6a54 3px,transparent 0,transparent 9px)}.rectangle .part.dotted{background-image:radial-gradient(#fc6a54 1.5px,transparent 0);background-size:9px 9px}
    javascript:
      function rational(n, d) {
        const g = (a, b) => b ? g(b, a % b) : a, x = g(n, d);
        return [n / x, d / x];
      }
      window.prepareResult = function() {
        const n = document.querySelector('.numerator'), d = document.querySelector('.denominator');
        const [uN, uD] = [parseInt(n.textContent), parseInt(d.textContent)];
        const [rN, rD] = [parseInt(n.dataset.result), parseInt(d.dataset.result)];
        const [a, b] = rational(uN, uD), [x, y] = rational(rN, rD);
        if (a == x && b == y) [n, d].forEach((el, i) => el.dataset.result = [uN, uD][i]);
      };
  TEXT
)

def generate_rules(taken, max)
  (1..max).to_a.flatten.map{ |i| { i => 'slash' }  }.shuffle.first(taken).inject(:merge)
end

2.times do
  data = [
    { numerator: 1, denominator: 2, items_per_row: 2, rules: generate_rules(1, 2) },
    { numerator: 1, denominator: 3, items_per_row: 3, rules: generate_rules(1, 3) },
    { numerator: 2, denominator: 3, items_per_row: 3, rules: generate_rules(2, 3) },
    { numerator: 1, denominator: 4, items_per_row: 2, rules: generate_rules(1, 4) },
    { numerator: 2, denominator: 4, items_per_row: 2, rules: generate_rules(2, 4) },
    { numerator: 3, denominator: 4, items_per_row: 2, rules: generate_rules(3, 4) },
    { numerator: 1, denominator: 6, items_per_row: 3, rules: generate_rules(1, 6) },
    { numerator: 2, denominator: 6, items_per_row: 3, rules: generate_rules(2, 6) },
    { numerator: 3, denominator: 6, items_per_row: 3, rules: generate_rules(3, 6) },
    { numerator: 4, denominator: 6, items_per_row: 3, rules: generate_rules(4, 6) },
    { numerator: 5, denominator: 6, items_per_row: 3, rules: generate_rules(5, 6) },
  ]

  data.each do |i|
    item_width = 110
    items_per_row = i[:items_per_row]
    item_height = 60 * i[:denominator] / i[:items_per_row]
    column_setting = "grid-template-columns: repeat(#{items_per_row.to_s}, 1fr);"
    size_setting = "width: #{item_width * items_per_row}px; height: #{item_height}px;"
    style = column_setting + size_setting

    Question.create!(
      question_template:,
      options: {
        numerator: i[:numerator],
        denominator: i[:denominator],
        rules: i[:rules],
        style:,
      },
    )
  end
end

