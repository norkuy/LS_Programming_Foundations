arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# my answer

arr.each_with_object([]) do |sub_arr, outer_arr|
  m_of_3 = sub_arr.select do |num|
    num % 3 == 0
  end
  outer_arr << m_of_3 if m_of_3.any?
end

#my answer 2

arr.map do |inner_arr|
  inner_arr.select do |num|
    num % 3 == 0
  end
end

# answer1

arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end

# answer2

arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end



