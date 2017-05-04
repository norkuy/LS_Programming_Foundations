def running_total(arr)
  total = 0
  new_arr = []
  arr.each do |num|
    running_amt = total += num
    new_arr << running_amt
  end
  new_arr
end

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

running_total([1,2,3,4,5,6,7,8,9,10])
# [1, 3, 6, 10, 15, 21, 28, 36, 45, 55]