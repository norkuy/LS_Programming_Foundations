def multiply_list(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |num, index|
    new_arr[index] = arr1[index] * arr2[index]
  end
  new_arr
end

multiply_list([1,2,3,4], [5,6,7,8])

def multiply_list(arr1, arr2)
  arr1.zip(arr2).flatten
end

multiply_list([1,2,3,4], [5,6,7,8])
