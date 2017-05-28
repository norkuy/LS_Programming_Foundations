def featured(num)
 
  next_num = num

  loop do
    
    no_repeats = next_num.to_s.chars.map(&:to_i).uniq.size ==  next_num.to_s.chars.map(&:to_i).size

    if next_num % 7 == 0 && next_num.odd? && no_repeats
      return next_num
    end

    return "No value" if next_num > 9876543210
      
    next_num += 1

  end

end

featured(3401)