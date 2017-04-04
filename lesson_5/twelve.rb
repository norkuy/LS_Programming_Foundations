arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# my answer

arr.map do |sub_arr|
  sub_arr.each_with_object({}) do |_, hash|
      hash[sub_arr.first] = sub_arr.last
    end
end

# answer

hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end