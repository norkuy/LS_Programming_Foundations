def reverse(arr)
  new_arr = []
  i = -1
  loop do
    new_arr << arr[i]
    break if i == -arr.size
    i -= 1
  end
  new_arr
end
reverse([1,2,3,4,5,6])
