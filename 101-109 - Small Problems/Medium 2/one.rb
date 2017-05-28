# Attempt

File.open("Frankenstein.txt", "r") do |f|
  
  current_line = ''
  temp = ''
  longest_line = ''

  f.each_line do |line|

    line.chars.each_with_index do |char, index|
      
      if ['.', '!', '?'].include?(char) || line[-2, -1] == ' '
        temp += line.slice(0, index)
        current_line = temp
        temp = ''
      else
        temp += line
      end

    end

    longest_line = current_line  if current_line > longest_line

  end

  puts longest_line
  puts longest_line.size

  f.close
end

# Answer

text = File.read('sample_text.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by { |sentence| sentence.split.size }
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"