# puts "Enter the length of the room in meters:"
# length =  gets.chomp.to_i
# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_i
# sq_meters = length.to_f * width
# sq_feet = sq_meters * 10.7639
# puts "The area of the room is #{sq_meters} square meters (#{sq_feet} square feet)"

SQFEET_TO_SQINCHES = 144
SQINCHES_TO_SQCENT = 6.4516

puts "Enter the length of the room in feet:"
length =  gets.chomp.to_i
puts "Enter the width of the room in feet:"
width = gets.chomp.to_i
sq_feet = length.to_f * width
sq_inches = sq_feet * SQFEET_TO_SQINCHES
sq_cent = sq_inches * SQINCHES_TO_SQCENT
puts "The area of the room is #{sq_feet} square feet (#{sq_inches} square inches, #{sq_cent} square centimeters)"


