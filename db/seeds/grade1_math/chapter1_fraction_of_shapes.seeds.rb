puts 'Creating MATH - Chapter 1 - Fraction of Shapes'

# TODO: Làm các dạng hình khác (tròn, ngũ giác, lục giác, bát giác...)
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
    = render partial: 'shared/modals/selector', locals: { options: (0..10).to_a }
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

# === Tô màu hình tương ứng với phân số
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :fraction_of_shapes,
  answer_type: :select_answer,
  slim_content: <<~TEXT
  .title
    span Tô màu hình tròn tương ứng với phân số 
    span == @question.options['fraction']
  .square.d-none data-result=@question.options['result']
  svg id="circle" viewBox="-5 0 110 100" data-parts=@question.options['parts']
    defs
      pattern#dotted-pattern patternUnits="userSpaceOnUse" width="9" height="9"
        rect width="9" height="9" fill="#ff7d6a"  <!-- Nền -->
        circle cx="1.5" cy="1.5" r="1.5" fill="#fff"
  scss:
    svg{width:180px;height:180px;cursor:pointer}.quarter{fill:#FFF;transition:.3s all}.quarter.active{fill:url(#dotted-pattern)}
  javascript:
    const x=parseInt(document.querySelector('svg').dataset.parts),svg=document.getElementById('circle'),r=50,c=50,step=2*Math.PI/x;for(let i=0;i<x;i++){const a1=i*step,a2=(i+1)*step,x1=c+r*Math.cos(a1),y1=c+r*Math.sin(a1),x2=c+r*Math.cos(a2),y2=c+r*Math.sin(a2),largeArc=(a2-a1)>Math.PI?1:0,path=document.createElementNS("http://www.w3.org/2000/svg","path");path.setAttribute("d",`M${c},${c} L${x1},${y1} A${r},${r} 0 ${largeArc} 1 ${x2},${y2} Z`),path.setAttribute("fill","#fffbf3"),path.setAttribute("stroke","#fc6a54"),path.setAttribute("stroke-width","1"),path.classList.add("quarter"),svg.appendChild(path)}const border=document.createElementNS("http://www.w3.org/2000/svg","circle");Object.entries({cx:c,cy:c,r:r-1,fill:"none",stroke:"#fc6a54","stroke-width":2}).forEach(([k,v])=>border.setAttribute(k,v)),svg.appendChild(border),document.querySelectorAll(".quarter").forEach(p=>p.addEventListener("click",()=>p.classList.toggle("active")));window.prepareResult=function(){document.querySelector(".square").textContent=document.querySelectorAll(".quarter.active").length};
  TEXT
)

data = [
  { numerator: 1, denominator: 2, parts: 4 },
  { numerator: 2, denominator: 2, parts: 4 },
  { numerator: 1, denominator: 3, parts: 3 },
  { numerator: 1, denominator: 3, parts: 6 },
  { numerator: 1, denominator: 3, parts: 9 },
  { numerator: 2, denominator: 3, parts: 3 },
  { numerator: 2, denominator: 3, parts: 6 },
  { numerator: 2, denominator: 3, parts: 9 },
  { numerator: 3, denominator: 3, parts: 6 },
  { numerator: 1, denominator: 4, parts: 4 },
  { numerator: 1, denominator: 4, parts: 8 },
  { numerator: 2, denominator: 4, parts: 4 },
  { numerator: 2, denominator: 4, parts: 8 },
  { numerator: 3, denominator: 4, parts: 4 },
  { numerator: 3, denominator: 4, parts: 8 },
  { numerator: 4, denominator: 4, parts: 8 },
  { numerator: 1, denominator: 6, parts: 6 },
  { numerator: 2, denominator: 6, parts: 6 },
  { numerator: 3, denominator: 6, parts: 6 },
  { numerator: 4, denominator: 6, parts: 6 },
  { numerator: 5, denominator: 6, parts: 6 },
]

data.each do |i|
  Question.create!(
    question_template:,
    options: {
      fraction: Katex.render('\\frac{' + i[:numerator].to_s + '}{' + i[:denominator].to_s + '}'),
      parts: i[:parts],
      result: i[:parts] / i[:denominator] * i[:numerator]
    },
  )
end

