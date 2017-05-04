DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)

  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  return -value if sign == '-'
  value
end

string_to_integer('+300')

def string_to_signed_integer(string)

  sign = string.slice!(0)
  
  if sign == '-'
    -string_to_integer(string[1..-1])
  else
    string_to_integer(string[1..-1])
  end

end