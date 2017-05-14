def word_sizes(str)
  word_hash = Hash.new(0)
  words = str.split(" ")
  words.each do |word|
    word_length = 0
    word.chars.each do |char|
      chars = ('A'..'Z').to_a + ('a'..'z').to_a
      if chars.include?(char)
        word_length += 1
      end
    end
    word_hash[word_length] += 1
  end
  word_hash
end