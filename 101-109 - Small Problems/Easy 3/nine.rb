def palindrome?(input)
  return true if input.delete(' ').downcase.reverse == input
  puts "Not a palindrome!" if input.reverse != input
end

def real_palindrome?(str)
  string = str.downcase.delete('^a-z0-9')
  palindrome?(string)
end
