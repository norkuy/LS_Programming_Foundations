puts "What is your name?"
name = gets.chomp!

if name.end_with?("!")
  name.chop!
  puts "hello #{name} why are you screaming".upcase
else
  puts "hello #{name}"
end
