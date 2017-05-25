def rotate_array(arr)
  new_arr = []
  first = arr.slice(0, 1)
  new_arr = arr.slice(1, arr.length) + first
end