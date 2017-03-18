def double_numbers!(numbers, multiply_val)
  counter = 0
  multiplied_vals = []
  loop do
    break if counter == numbers.size
    current_val = numbers[counter]
    multiplied_vals << current_val * multiply_val
    counter += 1
  end

  multiplied_vals
end

double_numbers!([1,2,3,4,5], 10)