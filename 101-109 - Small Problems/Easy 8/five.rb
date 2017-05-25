def substrings_at_start(str)
  new_arr = []
  str.chars.each_with_index do |_, index|
    new_str = ''
    index.upto(str.size - 1) do |count|
      substring = str[count].downcase.gsub(/[^a-z0-9\s]/i, '')
      new_str += "#{substring}"
      new_arr << new_str
    end
  end
  new_arr
end

def palindromes(str)
 full_arr = substrings_at_start(str)
palindrome_arr = []
 full_arr.each do |substring|
    if substring.size > 1 && substring.reverse == substring
      palindrome_arr << substring 
    end
 end
 palindrome_arr
end


palindromes('ab&*%@!bacd33dcefghiuupp')
