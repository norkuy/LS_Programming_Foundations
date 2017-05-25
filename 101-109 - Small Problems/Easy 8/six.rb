def fizzbuzz(start, ending)
  start.upto(ending) do |count|
    if count % 3 == 0 && count % 5 == 0
      puts "FizzBuzz"
    elsif count % 3 == 0
      puts "Fizz"
    elsif count % 5 == 0
      puts "Buzz"
    else
      puts count
    end
  end
end

fizzbuzz(1, 100)
