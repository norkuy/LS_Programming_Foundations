def alphabetic_number_sort(arr)
  num_hash = {1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 15 => 'fifeteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen', 19 => 'nineteen'}
  words = []
  sorted_nums = []
  arr.each do |num|
    words <<  num_hash[num]
  end
  sorted = words.sort do |a, b|
    a <=> b
  end
  sorted.each do |word|
    sorted_nums << num_hash.key(word)
  end
  sorted_nums
end

alphabetic_number_sort((1..19).to_a)

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end