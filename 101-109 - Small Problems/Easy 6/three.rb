def find_fibonacci_index_by_length(num)
  i = 1
  places = num
  arr = []
  loop do
    if i == 1 || i == 2
      arr[i] = 1
    else
      arr[i] = arr[i - 1] + arr[i - 2]
        if arr[i].to_s.size >= places
          puts arr[i]
          return i
        end
    end
    i += 1
  end
  arr
end

find_fibonacci_index_by_length(10000)