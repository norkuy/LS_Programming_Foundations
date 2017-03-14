def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

# my_string passed in by value which is a reference
# to a string object. Inside the method, a new method
# variable is created and the reference is placed there.
# When String#+= method is run, a new string object
# is created with the new value and the old one is forgotten.
# The old parameter string is still remembered by the caller
# but forgotten by the method.
puts "My string looks like this now: #{my_string}"

# my_array passed in by value which is a reference
# to an array object. Inside the method, a new method
# variable is created and the reference is place there.
# When Array#<< method is run, the array is updated
# outside the method.
puts "My array looks like this now: #{my_array}"

