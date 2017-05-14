def cleanup(str)
  words = str.split
  words.each do |word|
    word.chars.each_with_index do |char, index|
      chars = ("A".."Z").to_a + ("a".."z").to_a
        word[index] = ' ' if !chars.include?(char)
      end
    end
    words.join(" ").gsub(/\s+/, ' ')
end
cleanup('This&@ i@s# a sen&*1ten656ce')
# "This i s a sen ten ce"