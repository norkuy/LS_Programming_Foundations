def palindronmic_number?(num)
  num.to_s.reverse.to_i == num.to_i
end