def buy_fruit(arr)
  new_arr = []
  arr.each do |item|
    1.upto(item[1]) do |num|
      new_arr << item[0]
    end
  end
  new_arr
end