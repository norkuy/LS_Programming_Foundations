def negative(num)
  return -num if num.positive?
  return num if num.negative? || num == 0
end

negative(10)