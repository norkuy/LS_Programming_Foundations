[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# returns true because 'hi' is a true statment so all
# values in the array are evaluated as true [1, 2, 3]

