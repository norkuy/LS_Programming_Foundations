def ascii_value(str)
  total = 0
  str.chars.each { |char| total += char.ord }
  total
end

# I think the mystery method is chr
# 'J'.ord.chr equals 'J'
# If there's more than one character, only the first is used.