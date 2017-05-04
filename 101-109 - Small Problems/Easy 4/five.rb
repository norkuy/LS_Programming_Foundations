def multisum(num)
  new_arr = []
  (1).upto(num) do |num|
    new_arr << num if num % 3 == 0 || num % 5 == 0
  end
  new_arr.inject(0, :+)
  p new_arr
end

multisum(30)