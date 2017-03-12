# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.
# Difference between explicit vs implicit return?

def factors(number)
  if number == 0 || number.negative?
  return "Number is 0 or negative!"
  end
  dividend = number
  divisors = []
  number.downto(1) do |dividend|
    divisors << number / dividend if number % dividend == 0
  end
  divisors
end

factors(-10)
