def word_lengths(str)
  arr = []
  words = str.split(" ")
  words.each do |word|
    arr << "#{word} #{word.size}"
  end
  arr
end