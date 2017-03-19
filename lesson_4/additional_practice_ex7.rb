statement = "The Flintstones Rock"

# my answer
arr_statement = statement.delete(' ').split('')
my_hash = {}
my_hash.default = 0

arr_statement.each do |letter|
  my_hash[letter] += 1
end

p my_hash

# answer
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end


