def stringify(num, binary)
  arr = []
  if binary == 1
    one = 1
    two = 0
  elsif binary == 0
   one = 0
   two = 1
  end
  i = 0
  num.times do |i|
    arr[i] = binary
    binary == one ? binary = two : binary = one
    i += 1
  end
  arr.join
end

stringify(5, 0)