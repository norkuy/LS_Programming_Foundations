def oddities(arr)
  new_arr = []
  arr.each_with_index do |item, index|
    new_arr << item if (index + 1).odd?
  end
  new_arr
end

def even(arr)
  new_arr = []
  arr.each_with_index do |item, index|
    new_arr << item if (index + 1).even?
  end
  new_arr
end

def even(arr)
  new_arr = []
  i = 1
  while i < arr.size
    new_arr << arr[i]
    i += 2
  end
  new_arr
end