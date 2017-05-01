def sum(num)
  total = 0
  num.to_s.split("").each do |num|
    total += num.to_i
  end
  total
end

sum(931)