def triangle(num)
  i = 1
  total_spaces = num - 1
  space = ' '
  loop do
    puts (space * total_spaces) + ('*' * i)
    break if i >= num
    i += 1
    total_spaces -= 1
  end
end

triangle(100)