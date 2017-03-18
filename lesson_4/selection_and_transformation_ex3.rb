def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if numbers.index(current_number).odd?
    doubled_numbers << current_number
    counter += 1
  end

  doubled_numbers
end

double_odd_numbers([1,2,3,10,50,100])