def word_cap(str)
  words = str.split
  words.map do |word|
    word.slice!(0, 1).upcase + word
  end.join(' ')
end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end
