def interleave(arr1, arr2)
  new_arr = []
  total = arr1.size + arr2.size
  switcher = true
  i = 0
  until i >= total
      if switcher == true
        new_arr[i] = arr1.shift
      elsif switcher == false
        new_arr[i] = arr2.shift
      end
      i += 1
      switcher == true ? switcher = false : switcher = true
  end
  new_arr
end

interleave([1,2,3,4,5], ['a', 'b', 'c', 'd', 'e'])

[1,2,3,4,5].zip(['a', 'b', 'c', 'd', 'e']).flatten
