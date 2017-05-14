def swap(words)
  words_arr = words.split(" ")
  words_arr.map do |word|
    if word.size > 1
      first = word.slice!(0)
      last = word.slice!(-1)
      last + word + first
    else
      word
    end
  end.join(" ")
end

swap('I love Ruby')
# "I eovl yubR"
# The first swap_first_last_characters method returns word
# at the end of the method, while the second version doesn't
# so it will only give back the first and last letters of
# the words.