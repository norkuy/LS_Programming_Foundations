def twice(num)
  arr = num.to_s.split("")
  split_arr = arr.each_slice(2).to_a
  if split_arr[0] == split_arr[1]
    return arr.join.to_i
  else
    return arr.join.to_i * 2
  end
end

def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end

twice(1012)