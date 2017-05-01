puts "What is your age?"
current_age = gets.chomp.to_i
puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

age_difference = retire_age - current_age

puts "It's #{Time.now.year}. You will retire in #{Time.now.year + age_difference}"
puts "You only have #{age_difference} years of work to go!"