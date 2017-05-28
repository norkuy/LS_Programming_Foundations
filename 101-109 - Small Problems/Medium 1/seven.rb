def word_to_digit(str)
nums = {'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9}
  arr = str.split.map do |token|
    nums.fetch(token) {  |_| " #{token} " }
  end.join
end

word_to_digit('this is a string five nine nine two three six of numbers')