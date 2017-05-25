def staggered_case(str)
  str.chars.each_with_index.map do |char, index|
    if index.even?
      char.upcase
    elsif index.odd?
      char.downcase
    end
  end.join
end
