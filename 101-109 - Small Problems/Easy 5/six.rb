def word_sizes(str)
  word_hash = {}
  words = str.split(" ")
  words.each do |word|
     if word_hash[word.size].nil?
      word_hash[word.size] = 1
     else
      word_hash[word.size] += 1
     end
  end
  word_hash
end