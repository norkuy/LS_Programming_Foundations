num = 1
loop do
puts "Enter an integer greater than 0"
num = gets.chomp
break if num.to_i.to_s == num
end
num = num.to_i

puts "Enter 's' to compute sum, 'p' to compute product."
calc = gets.chomp

nums = "1 to #{num}"

if calc == 's'
  total= 1.upto(num).inject(:+)
  puts "The sum of the integers between #{nums} is #{total}"
elsif calc == 'p'
  total= 1.upto(num).inject(:*)
  puts "The product of the integers between #{nums} is #{total}"
end


