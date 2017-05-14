def find_dup(arr)
  sorted = arr.sort
  sorted.each do |num|
    if arr.count(num) > 1
      return num
    end
  end  
end