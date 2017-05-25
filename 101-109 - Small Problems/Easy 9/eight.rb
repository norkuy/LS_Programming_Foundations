def sequence(num1, num2)
  arr = []
  1.upto(num1) do |num|
    arr << num * num2
  end
  arr
end