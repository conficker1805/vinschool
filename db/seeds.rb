['question_templates', 'questions', 'answers'].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
end

puts '---------GRADE 1--------'
Rake::Task['db:seed:g1_math'].invoke
