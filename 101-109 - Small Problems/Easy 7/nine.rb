def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |1_num|
    arr2.each do |2_num|
      new_arr << 1_num * 2_num
    end
  end
  new_arr.sort
end

multiply_all_pairs([1,2], [2,4,5,1])
