def palindrome(input)
  return true if input.reverse == input
  puts "Not a palindrome!" if input.reverse != input
end

palindrome('356653')


