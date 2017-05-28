def bubble_sort!(arr)
index = 0
completed_passes = 0
  loop do
    index = 0 if index == arr.size - 1
    case
    when completed_passes == arr.size - 2
      break
    when arr[index] > arr[index + 1] # main sort
      arr[index], arr[index + 1] = arr[index + 1], arr[index]
      completed_passes = 0
    when arr[index] < arr[index + 1]
      completed_passes += 1
    end
    index += 1
  end
arr
end

bubble_sort!([90, 52, 100, 3, 12, 10, 4, 55, 33, 9, 3, 2, 1, 5])
# [1, 2, 3, 3, 4, 5, 9, 10, 12, 33, 52, 55, 90, 100]
bubble_sort!(['John', 'Nick', 'Steven', 'Amy', 'Michele', 'Jeff'])
# ["Amy", "Jeff", "John", "Michele", "Nick", "Steven"]