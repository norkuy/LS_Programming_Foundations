def include?(arr, search_num)
  arr.any? { |num| num == search_num }
end


include?([1,3,4,5,6,7,8], 10)
