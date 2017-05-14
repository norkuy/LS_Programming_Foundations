def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

def merge(array_1, array_2)
  array_1 | array_2
end

merge([1,2,3], [3,4,5])