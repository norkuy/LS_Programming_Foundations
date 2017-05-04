puts "Please write a word or multiple words:"
words = gets.chomp

puts "There are #{words.split(" ").join.size} characters in #{words}"
