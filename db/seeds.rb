['question_templates', 'questions', 'answers'].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table_name} RESTART IDENTITY")
end

puts '---------GRADE 1--------'
puts 'Creating MATH - Chapter 1'
Rake::Task['db:seed:grade1_math:chapter1_numbers'].invoke
Rake::Task['db:seed:grade1_math:chapter1_numbers_even_odd'].invoke
Rake::Task['db:seed:grade1_math:chapter1_numbers_tens_addition'].invoke
Rake::Task['db:seed:grade1_math:chapter1_numbers_addition_subtraction'].invoke
Rake::Task['db:seed:grade1_math:chapter1_numbers_multiplication_division'].invoke
Rake::Task['db:seed:grade1_math:chapter1_venn_chart'].invoke
Rake::Task['db:seed:grade1_math:chapter1_repeated_addition'].invoke
Rake::Task['db:seed:grade1_math:chapter1_fraction_of_numbers'].invoke
Rake::Task['db:seed:grade1_math:chapter1_fraction_of_shapes'].invoke
Rake::Task['db:seed:grade1_math:chapter1_breakdown_multiplication'].invoke
Rake::Task['db:seed:grade1_math:chapter1_number_ordering'].invoke
Rake::Task['db:seed:grade1_math:chapter1_number_sequence'].invoke

puts 'Creating MATH - Chapter 3'
Rake::Task['db:seed:grade1_math:chapter3_money_calculation'].invoke

puts 'Creating MATH - Chapter 4'
Rake::Task['db:seed:grade1_math:chapter4_reverse_calculation'].invoke
Rake::Task['db:seed:grade1_math:chapter4_statistical_chart_quantity_comparison'].invoke

puts 'Creating MATH - Chapter 5'
Rake::Task['db:seed:grade1_math:chapter5_clock'].invoke
Rake::Task['db:seed:grade1_math:chapter5_scale'].invoke
Rake::Task['db:seed:grade1_math:chapter5_2d_shapes'].invoke
Rake::Task['db:seed:grade1_math:chapter5_3d_shapes'].invoke

puts 'Creating MATH - Chapter 6'
Rake::Task['db:seed:grade1_math:chapter6_time'].invoke
Rake::Task['db:seed:grade1_math:chapter6_calendar'].invoke
Rake::Task['db:seed:grade1_math:chapter6_repeating_pattern'].invoke
Rake::Task['db:seed:grade1_math:chapter6_block_diagram'].invoke
Rake::Task['db:seed:grade1_math:chapter6_shape_rotation'].invoke
Rake::Task['db:seed:grade1_math:chapter6_direction'].invoke

