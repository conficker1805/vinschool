puts 'Creating MATH - Chapter 6 - Direction Home'

class MatrixPathAnalyzer
  attr_reader :left_turns, :right_turns, :path_values

  def initialize(arr, path_values)
    @arr = arr
    @path_values = path_values
    @pos_map = build_position_map
    @left_turns = 0
    @right_turns = 0
    @initial_direction = [0, 1] # luôn đi từ trái sang
    analyze
  end

  private

  def build_position_map
    map = {}
    @arr.each_with_index do |row, i|
      row.each_with_index do |val, j|
        map[val] = [i, j]
      end
    end
    map
  end

  def direction(from, to)
    [to[0] - from[0], to[1] - from[1]]
  end

  def turn_direction(dir1, dir2)
    cross = dir1[0] * dir2[1] - dir1[1] * dir2[0]

    if cross > 0
      :left
    elsif cross < 0
      :right
    else
      :straight
    end
  end

  def analyze
    coords = @path_values.map { |val| @pos_map[val] }
    return if coords.size < 2

    dir1 = @initial_direction

    (0..coords.size - 2).each do |i|
      from = coords[i]
      to = coords[i + 1]
      dir2 = direction(from, to)

      case turn_direction(dir1, dir2)
      when :left
        @left_turns += 1
      when :right
        @right_turns += 1
      end

      dir1 = dir2
    end
  end
end

class MatrixPathFinder
  MOVES = [
    [-1, 0], # lên
    [1, 0],  # xuống
    [0, -1], # trái
    [0, 1]   # phải
  ]

  def initialize(arr)
    @arr = arr
  end

  def find_position(target)
    @arr.each_with_index do |row, i|
      row.each_with_index do |num, j|
        return [i, j] if num == target
      end
    end
    nil
  end

  def find_path(start_val, goal_val, max_steps, max_attempts = 1000)
    start = find_position(start_val)
    goal = goal_val
    attempt = 0
    path = nil

    while path.nil? && attempt < max_attempts
      path = random_dfs(start, goal, max_steps)
      attempt += 1
    end

    path
  end

  private

  def random_dfs(current_pos, goal, max_steps, visited = [], path = [])
    x, y = current_pos
    return nil if visited.include?(current_pos)

    visited << current_pos
    path << current_pos

    return path if @arr[x][y] == goal
    return nil if path.size >= max_steps

    MOVES.shuffle.each do |dx, dy|
      nx, ny = x + dx, y + dy
      if nx.between?(0, @arr.length - 1) && ny.between?(0, @arr[0].length - 1)
        unless visited.include?([nx, ny])
          result = random_dfs([nx, ny], goal, max_steps, visited.dup, path.dup)
          return result if result
        end
      end
    end

    nil
  end
end

question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 1,
  question_type: :direction,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Điền số thích hợp vào chỗ trống
    span Chiếc máy bay đang bay về đích theo đường đã được tô màu
    .row
      .col-md-5
        .matrix.position-relative.d-inline-grid.mt-3 style=('grid-template-columns: repeat(' + @question.options['items_per_row'].to_s + ', 50px)')
          - @question.options['matrix'].each_with_index do |item, idx|
            - if @question.options['path'].include?(item)
              - text = item == @question.options['items_per_row'] ? fa_icon('flag-checkered', class: 'color-light-coral-red') : ''
              - klass = (@question.options['matrix'].count - @question.options['items_per_row'] + 1) == item ? 'root' : ''
              .square.background-coral-red class=klass = text
            - else
              .square.background-light-coral-red
          = fa_icon 'jet-fighter', class: 'fs-2 position-absolute start'
      .col-md-7
        .statement.display-list-item.mt-3
          span Máy bay quay một phần tư vòng theo chiều kim đồng hồ
          span.text-success.bold.px-2 data-action="click->selector#openModal" data-result=@question.options['right_turn'] data-replace='....'
          span lần
        .statement.display-list-item.mt-3
          span Máy bay quay một phần tư vòng ngược chiều kim đồng hồ
          span.text-success.bold.px-2 data-action="click->selector#openModal" data-result=@question.options['left_turns'] data-replace='....'
          span lần
        .statement.display-list-item.mt-3
          span Máy bay đã rẽ vuông góc tổng cộng
          span.text-success.bold.px-2 data-action="click->selector#openModal" data-result=(@question.options['left_turns'] + @question.options['right_turns']) data-replace='....'
          span lần
    = render partial: 'shared/modals/selector', locals: { options: (0..10).to_a }
    scss:
      .matrix{padding:0 30px}.start{bottom:5px;left:-10px}.statement{display:list-item}
  TEXT
)

10.times do
  arr = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]
  ]

  finder = MatrixPathFinder.new(arr)
  max_steps = 7
  path_values = []
  finder.find_path(13, 4, max_steps).each do |x, y|
    path_values << arr[x][y]
  end

  analyzer = MatrixPathAnalyzer.new(arr, path_values)

  Question.create!(
    question_template:,
    options: {
      matrix: arr.flatten,
      path: analyzer.path_values,
      left_turns: analyzer.left_turns,
      right_turns: analyzer.right_turns,
      items_per_row: arr.first.count,
    },
  )
end
