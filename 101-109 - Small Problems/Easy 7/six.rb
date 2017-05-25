def staggered_case(str, include_all_chars)
  upper = true
  str.chars.map do |char|
    alpha_chars = ('A'..'Z').to_a + ('a'..'z').to_a
    if alpha_chars.include?(char) || include_all_chars 
      if upper == true
        upper = !upper
        char.upcase
      elsif upper == false
        upper = !upper
        char.downcase
      end
    else
      char
    end
  end.join
end

staggered_case('te$st sen#tence', true)
