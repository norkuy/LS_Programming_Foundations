def penultimate(str)
  words = str.split(" ")
  puts words[-2]
end

def penultimate(str)
  words = str.split(" ")
  if words.size == 1
    puts words[0] 
  elsif words.size == 0
    puts "No words" 
  end
  if words.size > 1
    puts words[words.size / 2] if words.size.odd?
    puts "#{words[(words.size / 2) - 1]} #{words[words.size / 2]}" if words.size.even?
  end
end
