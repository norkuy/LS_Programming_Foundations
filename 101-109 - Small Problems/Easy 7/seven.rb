def show_multiplicative_average(arr)
  return 0 if arr.any? { |num| num == 0 }
  total = 1.0
  arr.each do |num|
    total *= num
  end
  divided = total / arr.size
  divided.round(3)
end

show_multiplicative_average([1.4901,2.1,3.33,4,5,4.5])