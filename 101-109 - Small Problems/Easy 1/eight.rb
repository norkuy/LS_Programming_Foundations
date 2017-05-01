def average(arr)
  total = 0
  arr.each do |num|
    total += num
  end
  total.to_f / arr.count
end