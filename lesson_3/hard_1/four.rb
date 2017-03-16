def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4
  end
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end

# Note: Ben's original return true on the last line of the 
# method can be shortened to just true. This is because Ruby returns the result of the last evaluated expression.
