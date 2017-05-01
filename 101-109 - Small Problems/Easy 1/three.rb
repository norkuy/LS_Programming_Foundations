def digit_list(num)
  if !num.positive?
    puts "Must be positive number!"
  else
    num.to_s.split("").map { |num| num.to_i }     
  end
end

digit_list(104645531)