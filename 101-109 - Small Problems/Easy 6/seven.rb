def halvsies(arr)
   arr.each_slice((arr.size.to_f/2).ceil).to_a 
end

halvsies([1,2,3,4,5,6])

def halvsies(array)
  first_half = array.slice(0, (array.size / 2.0).ceil)
  second_half = array.slice(first_half.size, array.size - first_half.size)
  [first_half, second_half]
end

# array.size is divided by 2.0 instead of 2 so it can be rounded
# up by the .ceil method if it has a decimal amount. We want a 
# float in this scenario.
