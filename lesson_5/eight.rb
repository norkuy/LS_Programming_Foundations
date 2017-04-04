hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# my answer

hsh.each do |key, value|
  value.each do |word|
    word.chars.each do |char|
      if ('AEIOUaeiou').include?(char)
        puts char
      end
    end
  end
end

# answer

vowels = 'aeiou'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
