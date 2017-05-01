def reverse_words(words)
  reversed = words.split.map do |word|
    if word.size >= 5  
      word.reverse 
    else
      word
    end
  end
  reversed.join(' ')
end

reverse_words('Launch School is the best')