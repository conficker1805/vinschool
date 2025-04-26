puts 'Creating MATH - Chapter 5 - Calendar'

def vietnamese_day_name(date)
  day_name_with_indexes = (0..6).zip(day_names).to_h
  day_name_with_indexes[date.wday]
end

def build_calendar_days(month, year)
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)

  wday = (first_day.wday - 1) % 7 # 0 = Sunday, 1 = Monday, ..., 6 = Saturday

  days = Array.new(wday, "") # add padding before the 1st
  days += (1..last_day.day).map(&:to_s)
  days
end

def day_names
  ["Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"]
end

def years_range
  (1990..2030).to_a
end

def months_range
  (1..12).to_a
end

def day_range
  (1..31).to_a
end

# Dạng bài viết ngày tháng được highlight bằng chữ
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :calendar,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title Viết ngày được khoanh tròn bằng chữ
    .calendar.border-coral-red.background-light-coral-red.mb-3
      .header.bold.color-coral-red = 'Tháng ' + @question.options['month'] + ', ' + @question.options['year']
      .weekdays
        - %w[T2 T3 T4 T5 T6 T7 CN].each do |day|
          span = day
      .days
        - @question.options['calendar_days'].each do |day|
          - klass = [@question.options['date']].include?(day) ? 'highlight background-coral-red' : ''
          span[class=klass] = day
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="dayOfWeek" data-replace="........" data-result=@question.options['day_name']
    span.text-success.bold = ', ngày '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="day" data-replace="...." data-result=@question.options['date']
    span.text-success.bold = ' tháng '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="month" data-replace="...." data-result=@question.options['month']
    span.text-success.bold = ' năm '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="year" data-replace="...." data-result=@question.options['year']
    = render partial: 'shared/modals/selector', locals: { id: 'dayOfWeek', options: @question.options['day_names'] }
    = render partial: 'shared/modals/selector', locals: { id: 'day', options: (1..31).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'month', options: (1..12).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'year', options: (1990..2030).to_a }
    scss:
      .calendar{width:300px;border:4px solid;border-radius:16px;padding:10px 15px 5px;box-sizing:border-box;text-align:center}.calendar .header{font-size:28px;margin-bottom:10px}.calendar .weekdays,.calendar .days{display:grid;grid-template-columns:repeat(7,1fr);gap:5px;margin-bottom:10px}.calendar .weekdays span,.calendar .days span{font-weight:bold}.calendar .days span{font-weight:normal;background:none;min-height:32px;display:flex;justify-content:center;align-items:center}.calendar .days span.highlight{color:#fff;font-weight:bold;box-shadow:0 0 5px rgba(0,0,0,0.2);border-radius:50%}
  TEXT
)

15.times.each do
  month = months_range.sample
  year = years_range.sample
  date = Date.parse("#{month}/#{year}")
  selected_date = (date.beginning_of_month..date.end_of_month).to_a.sample

  Question.create!(
    question_template:,
    options: {
      calendar_days: build_calendar_days(month, year),
      date: selected_date.day.to_s,
      month: selected_date.month.to_s,
      year: selected_date.year.to_s,
      day_name: vietnamese_day_name(selected_date),
      day_names:,
    },
  )
end

# Dạng bài viết ngày tháng trong tương lai (trong tháng)
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :calendar,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title.mb-5 = 'Hôm nay là ' + @question.options['day_name'] + ' ' + @question.options['today'] + '. Bạn ' + @question.options['name'] + ' sẽ ' + @question.options['text'] + ' sau ' + @question.options['week_count'].to_s + ' tuần nữa. Vậy đó là ngày nào?'
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="dayOfWeek" data-replace="........" data-result=@question.options['day_name']
    span.text-success.bold = ', ngày '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="day" data-replace="...." data-result=@question.options['results']['date']
    span.text-success.bold = ' tháng '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="month" data-replace="...." data-result=@question.options['results']['month']
    span.text-success.bold = ' năm '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="year" data-replace="...." data-result=@question.options['results']['year']
    = render partial: 'shared/modals/selector', locals: { id: 'dayOfWeek', options: @question.options['day_names'] }
    = render partial: 'shared/modals/selector', locals: { id: 'day', options: (1..31).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'month', options: (1..12).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'year', options: (1990..2030).to_a }
  TEXT
)

15.times do
  month = months_range.sample
  year = years_range.sample
  date = Date.parse("#{month}/#{year}")
  first_day_of_month = date.beginning_of_month
  selected_date = (first_day_of_month..(first_day_of_month + 6.days)).to_a.sample
  week_count = rand(1..3)
  target_date = selected_date + week_count.weeks

  names = ['Đức Thiện', 'Đồng Vy', 'Bảo Hân', 'Minh Thư', 'Quỳnh Nga', 'Huyền']

  Question.create!(
    question_template:,
    options: {
      name: names.sample,
      day_names:,
      text: ['có bài kiểm tra Toán', 'có bài kiểm tra Tiếng Anh', 'được đi du lịch', 'đi thăm ông bà', 'được về quê', 'tham gia giải chạy bộ', 'tham gia cuộc thi toán Timo', 'đón sinh nhật', 'được mua máy tính mới', 'bắt đầu năm học mới'].sample,
      today: selected_date.to_fs(:date),
      day_name: vietnamese_day_name(selected_date),
      week_count:,
      results: {
        date: target_date.day.to_s,
        month: target_date.month.to_s,
        year: target_date.year.to_s,
      }
    },
  )
end

# Dạng bài viết ngày tháng trong tương lai (qua tháng khác)
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :calendar,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title.mb-2 = 'Hôm nay là ' + @question.options['day_name'] + ' ' + @question.options['today'] + '. Bạn ' + @question.options['name'] + ' sẽ ' + @question.options['text'] + ' sau ' + @question.options['week_count'].to_s + ' tuần nữa. Vậy đó là ngày nào?'
    .calendar.border-coral-red.background-light-coral-red.mb-3
      .header.bold.color-coral-red = 'Tháng ' + @question.options['month'] + ', ' + @question.options['year']
      .weekdays
        - %w[T2 T3 T4 T5 T6 T7 CN].each do |day|
          span = day
      .days
        - @question.options['calendar_days'].each do |day|
          - klass = [@question.options['date']].include?(day) ? 'highlight background-coral-red' : ''
          span[class=klass] = day

    span.text-success.bold data-action="click->selector#openModal" data-modal-name="dayOfWeek" data-replace="........" data-result=@question.options['day_name']
    span.text-success.bold = ', ngày '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="day" data-replace="...." data-result=@question.options['results']['date']
    span.text-success.bold = ' tháng '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="month" data-replace="...." data-result=@question.options['results']['month']
    span.text-success.bold = ' năm '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="year" data-replace="...." data-result=@question.options['results']['year']
    = render partial: 'shared/modals/selector', locals: { id: 'dayOfWeek', options: @question.options['day_names'] }
    = render partial: 'shared/modals/selector', locals: { id: 'day', options: (1..31).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'month', options: (1..12).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'year', options: (1990..2030).to_a }
    scss:
      .calendar{width:300px;border:4px solid;border-radius:16px;padding:10px 15px 5px;box-sizing:border-box;text-align:center}.calendar .header{font-size:28px;margin-bottom:10px}.calendar .weekdays,.calendar .days{display:grid;grid-template-columns:repeat(7,1fr);gap:5px;margin-bottom:10px}.calendar .weekdays span,.calendar .days span{font-weight:bold}.calendar .days span{font-weight:normal;background:none;min-height:32px;display:flex;justify-content:center;align-items:center}.calendar .days span.highlight{color:#fff;font-weight:bold;box-shadow:0 0 5px rgba(0,0,0,0.2);border-radius:50%}
  TEXT
)

15.times do
  month = months_range.sample
  year = years_range.sample
  date = Date.parse("#{month}/#{year}")
  last_day_of_month = date.end_of_month
  selected_date = ((last_day_of_month - 6.days)..last_day_of_month).to_a.sample
  week_count = rand(1..3)
  target_date = selected_date + week_count.weeks

  names = ['Đức Thiện', 'Đồng Vy', 'Bảo Hân', 'Minh Thư', 'Quỳnh Nga', 'Huyền']

  Question.create!(
    question_template:,
    options: {
      calendar_days: build_calendar_days(month, year),
      name: names.sample,
      day_names:,
      text: ['có bài kiểm tra Toán', 'có bài kiểm tra Tiếng Anh', 'được đi du lịch', 'đi thăm ông bà', 'được về quê', 'tham gia giải chạy bộ', 'tham gia cuộc thi toán Timo', 'đón sinh nhật', 'được mua máy tính mới', 'bắt đầu năm học mới'].sample,
      today: selected_date.to_fs(:date),
      date: selected_date.day.to_s,
      month: selected_date.month.to_s,
      year: selected_date.year.to_s,
      day_name: vietnamese_day_name(selected_date),
      week_count:,
      results: {
        date: target_date.day.to_s,
        month: target_date.month.to_s,
        year: target_date.year.to_s,
      }
    },
  )
end

# Dạng bài tìm ngày trong tuần xuất hiện lần thứ N
question_template = QuestionTemplate.create!(
  grade: 1,
  subject: :math,
  chapter: 5,
  question_type: :calendar,
  answer_type: :select_answer,
  slim_content: <<~TEXT
    .title.mb-3 Điền ngày tháng phù hợp vào chỗ trống
    .calendar.border-coral-red.background-light-coral-red.mb-3
      .header.bold.color-coral-red = 'Tháng ' + @question.options['month'] + ', ' + @question.options['year']
      .weekdays
        - %w[T2 T3 T4 T5 T6 T7 CN].each do |day|
          span = day
      .days
        - @question.options['calendar_days'].each do |day|
          span = day
    .fs-18.bold.mb-2 = 'Ngày ' + @question.options['day_name'] + ' thứ ' + @question.options['ordering'].to_s + ' là:'
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="dayOfWeek" data-replace="........" data-result=@question.options['day_name']
    span.text-success.bold = ', ngày '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="day" data-replace="...." data-result=@question.options['results']['date']
    span.text-success.bold = ' tháng '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="month" data-replace="...." data-result=@question.options['results']['month']
    span.text-success.bold = ' năm '
    span.text-success.bold data-action="click->selector#openModal" data-modal-name="year" data-replace="...." data-result=@question.options['results']['year']
    = render partial: 'shared/modals/selector', locals: { id: 'dayOfWeek', options: @question.options['day_names'] }
    = render partial: 'shared/modals/selector', locals: { id: 'day', options: (1..31).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'month', options: (1..12).to_a }
    = render partial: 'shared/modals/selector', locals: { id: 'year', options: (1990..2030).to_a }
    scss:
      .calendar{width:300px;border:4px solid;border-radius:16px;padding:10px 15px 5px;box-sizing:border-box;text-align:center}.calendar .header{font-size:28px;margin-bottom:10px}.calendar .weekdays,.calendar .days{display:grid;grid-template-columns:repeat(7,1fr);gap:5px;margin-bottom:10px}.calendar .weekdays span,.calendar .days span{font-weight:bold}.calendar .days span{font-weight:normal;background:none;min-height:32px;display:flex;justify-content:center;align-items:center}.calendar .days span.highlight{color:#fff;font-weight:bold;box-shadow:0 0 5px rgba(0,0,0,0.2);border-radius:50%}
  TEXT
)

5.times do
  month = months_range.sample
  year = years_range.sample
  date = Date.parse("#{month}/#{year}").all_month.to_a.sample
  ordering = rand(2..3)
  target_date = date.all_month.select { |d| d.wday == date.wday }[ordering - 1]

  Question.create!(
    question_template:,
    options: {
      calendar_days: build_calendar_days(month, year),
      day_names:,
      month: date.month.to_s,
      year: date.year.to_s,
      day_name: vietnamese_day_name(date),
      ordering: { 2 => 'hai', 3 => 'ba' }[ordering],
      results: {
        date: target_date.day.to_s,
        month: target_date.month.to_s,
        year: target_date.year.to_s,
      }
    },
  )
end
