puts "What is the bill?"
bill = gets.chomp.to_f
puts "What is the tip percentage?"
tip = gets.chomp.to_f
total_tip = '%.2f' % (bill * (tip / 100))
total_bill = '%.2f' % (bill + total_tip.to_f)
puts "The tip is $#{total_tip}"
puts "The total is $#{total_bill}"