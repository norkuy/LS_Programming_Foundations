numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  p numbers.shift(1)
end

# 1
# 2

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1
# 3
# when 1 is removed from the array the array indices are updated.
# so now 3 is in the 1st index position and is the next number.
# there is nothing in the 2nd position in the next iteration so
# the loop stops.
