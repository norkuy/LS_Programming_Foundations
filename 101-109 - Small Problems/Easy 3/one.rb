puts "Enter 1st number"
one = gets.chomp.to_i
puts "Enter 2nd number"
two = gets.chomp.to_i
puts "Enter 3rd number"
three = gets.chomp.to_i
puts "Enter 4th number"
four = gets.chomp.to_i
puts "Enter 5th number"
five = gets.chomp.to_i
puts "Enter last number"
six = gets.chomp.to_i

selections = [one,two,three,four,five]


find_num = selections.select do |num|
  six == num
end.empty?

if !find_num
  puts "The number #{six} appears in #{selections}"
else
  puts "The number #{six} does not appear in #{selections}"
end

