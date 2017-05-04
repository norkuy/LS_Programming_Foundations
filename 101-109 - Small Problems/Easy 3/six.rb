def xor?(value1, value2)
  (value1 && !value2) || (value2 && !value1)
end

xor?(2.even?, 2.even?)

# The || is a short circuit operator and will stop if the first condition is true.
# But the inner conditions won't short curcuit because both conditions must be true.
