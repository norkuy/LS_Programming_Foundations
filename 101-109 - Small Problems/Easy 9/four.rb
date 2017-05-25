def sequence(num)
  return "Must be greater than 0!" if num <= 0
  arr = []
  0.upto(num) do |current|
    arr << current
  end
  arr
end

sequence(10)