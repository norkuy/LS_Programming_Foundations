# my answer
def titlesize(str)
  str_arr = str.split(" ")
  counter = 0
  loop do
    str_arr[counter].capitalize!  
    counter += 1
    break if counter == str_arr.size 
  end
  str_arr.join(" ")
end

titlesize("the flintstones rock")

# answer
words.split.map { |word| word.capitalize }.join(' ')

