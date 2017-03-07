# 1. a method that returns the sum of two integers

START
  GET User Input
  SET Value1 = User Input
  GET User Input
  SET Value2 = User Input
  PRINT Value1 + Value2
END

# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together

START
  SET str = nil
  SET arr = array values
  WHILE iterator < array length
    SET current_val = current iterator
    SET str = str + current_val
  END
  PRINT str
END

# 3. a method that takes an array of integers, and returns a new array with every other element

START
  SET new_arr = empty array
  SET old_arr = array with starting values
  WHILE iterator < old_arr length # can use .select here
    IF old_arr's key is odd
      ADD current old_arr value to new_arr array
    END
END
