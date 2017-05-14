def remove_vowels(strs)
  no_vowel_arr = []
  strs.each do |str|
    word = str.delete('aeiouAEIOU')
    no_vowel_arr << word 
  end
  no_vowel_arr
end

remove_vowels(['abceio', 'vowel'])