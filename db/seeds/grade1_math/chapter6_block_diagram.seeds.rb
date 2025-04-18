class BlockDiagramNumberGenerator
  Rule ||= Struct.new(:key, :arity, :apply, :describe)

  def initialize
    @rules = define_rules
    @used_rule_keys = []
    @result = {}
  end

  def generate(keys)
    first_key = keys.first.to_sym
    first_value = rand(1..6)

    @result[first_key] = {
      value: first_value,
      text: "Số #{first_key} xuất hiện #{first_value} lần"
    }

    keys[1..].each do |key|
      key_sym = key.to_sym
      value_data = generate_value(key_sym)

      @result[key_sym] = {
        value: value_data[:value],
        text: "Mặt số #{key_sym} #{value_data[:description]}"
      }
    end

    @result
  end

  private

  def define_rules
    [
      Rule.new(:double, 1, ->(x) { x * 2 }, ->(l1) { "xuất hiện nhiều gấp đôi mặt số #{l1}" }),
      Rule.new(:triple, 1, ->(x) { x * 3 }, ->(l1) { "xuất hiện nhiều gấp ba mặt số #{l1}" }),
      Rule.new(:half, 1, ->(x) { x.even? ? x / 2 : nil }, ->(l1) { "có số lần xuất hiện bằng một nửa mặt số #{l1}" }),
      Rule.new(:plus_1, 1, ->(x) { x + 1 }, ->(l1) { "xuất hiện nhiều hơn mặt số #{l1} một lần" }),
      Rule.new(:minus_1, 1, ->(x) { x - 1 }, ->(l1) { "xuất hiện ít hơn mặt số #{l1} một lần" }),
      Rule.new(:plus_2, 1, ->(x) { x + 2 }, ->(l1) { "xuất hiện nhiều hơn mặt số #{l1} hai lần" }),
      Rule.new(:minus_2, 1, ->(x) { x - 2 }, ->(l1) { "xuất hiện ít hơn mặt số #{l1} hai lần" }),
      Rule.new(:same_as, 1, ->(x) { x }, ->(l1) { "xuất hiện bằng với mặt số #{l1}" }),
      Rule.new(:sum_of_two, 2, ->(x, y) { x + y }, ->(l1, l2) { "có số lần xuất hiện bằng tổng của mặt số #{l1} và mặt số #{l2}" }),
      Rule.new(:x_minus_y_plus_z, 3, ->(x, y, z) { x - y + z }, ->(l1, l2, l3) { "có số lần xuất hiện bằng mặt #{l1} - mặt #{l2} + mặt #{l3}" }),
      Rule.new(:x_plus_y_minus_z, 3, ->(x, y, z) { x + y - z }, ->(l1, l2, l3) { "có số lần xuất hiện bằng mặt #{l1} + mặt #{l2} - mặt #{l3}" })
    ]
  end

  def generate_value(current_key)
    from_refs = @result.to_a

    @rules.shuffle.each do |rule|
      next if @used_rule_keys.include?(rule.key)

      refs = from_refs.shuffle
      next unless refs.size >= rule.arity

      selected_refs = refs.take(rule.arity)
      values = selected_refs.map { |_, data| data[:value] }
      result = rule.apply.call(*values)

      if result.is_a?(Integer) && result.between?(1, 6)
        @used_rule_keys << rule.key
        labels = selected_refs.map(&:first)
        description = rule.describe.call(*labels)

        return {
          value: result,
          description: description
        }
      end
    end

    fallback = rand(1..6)
    {
      value: fallback,
      description: "Mặt số #{current_key} xuất hiện #{fallback} lần"
    }
  end
end


puts 'Creating MATH - Chapter 6 - Block Diagram'

# ===== Biểu đồ khối =====
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :block_diagram,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Hoàn thành biểu đồ khối dựa vào dữ liệu dưới đây
    - @question.options['statements'].each do |s|
      .fs-14 = s
    .chart-container
      .y-axis-line
      .chart
        - @question.options['results'].values.each do |r|
          .column
            - 1.upto(6).each do |i|
              - if i <= r['value']
                .block.fs-0.background-light-coral-red.mb-1 data-result='true'
              - else
                .block.fs-0.background-light-coral-red.mb-1 data-result='false' false
      .x-axis-line
      .x-axis
        - (1..6).each do |i|
          .x-label=i
      .x-title = @question.options['x_title']
      .y-title = @question.options['y_title']

    scss:
      $axis-height:55px;$block-width:90px;$block-height:30px;.chart-container{margin-top:20px;margin-left:20px;position:relative;padding-left:15px;display:inline-block;.y-axis-line{position:absolute;left:0;top:0;width:2px;height:calc(100% - $axis-height);background:black;}.x-axis-line{position:absolute;bottom:$axis-height;left:0;height:2px;width:100%;background:black;}.chart{display:flex;gap:10px;align-items:flex-end;.column{display:flex;flex-direction:column-reverse;}.block{cursor:pointer;width:$block-width;height:$block-height;border:1px solid black;&.active{background-image:url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"%3E%3Cpath d="M50 80s25-20 25-35c0-11-8-17-17-17-7 0-12 5-15 10-3-5-8-10-15-10-9 0-17 6-17 17 0 15 25 35 25 35z" fill="%23ff6b6b" /%3E%3C/svg%3E');background-size:22px 13px;background-repeat:repeat;}}}.x-axis{display:flex;gap:10px;margin-top:10px;.x-label{width:$block-width;text-align:center;font-weight:bold;}}.x-title{text-align:center;font-weight:bold;margin-top:5px;}.y-title{position:absolute;left:-30px;top:40%;transform:translateY(-50%) rotate(180deg);writing-mode:vertical-rl;text-align:center;font-weight:bold;min-height:100%;}}
    javascript:
      document.querySelectorAll(".block").forEach(block => {
        block.addEventListener("click", () => {
          block.classList.toggle("active");
          block.textContent = block.textContent === "true" ? "false" : "true";
        });
      });
  TEXT
)

15.times do
  g = BlockDiagramNumberGenerator.new

  options = {
    x_title: 'Mặt xúc xắc',
    y_title: 'Số lần tung',
    results: g.generate(%w[1 2 3 4 5 6])
  }
  Question.create!(
    question_template:,
    options: options.merge(statements: options[:results].values.map{ |i| i[:text] }),
  )
end
