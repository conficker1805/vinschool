['question_templates', 'questions', 'answers'].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
end

puts '---------GRADE 1--------'

puts 'Creating MATH - Chapter 1'
Rake::Task['db:seed:grade1_math:chapter1_repeated_addition'].invoke
Rake::Task['db:seed:grade1_math:chapter1_fraction_of_number'].invoke
Rake::Task['db:seed:grade1_math:chapter1_breakdown_multiplication'].invoke

puts 'Creating MATH - Chapter 4'
Rake::Task['db:seed:grade1_math:chapter4_reverse_calculation'].invoke
Rake::Task['db:seed:grade1_math:chapter4_statistical_chart_quantity_comparison'].invoke
