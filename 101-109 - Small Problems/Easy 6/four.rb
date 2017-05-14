def reverse!(list)
  back = -1
  index = 0
      list.each_with_index do |_, index|
        list[back], list[index] = list[index], list[back]
        p list
        back -= 1
        index += 1
        break if index == list.size / 2
      end
end

reverse!([1,2,3,4,5,6])