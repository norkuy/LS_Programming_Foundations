def substrings_at_start(str)
  new_arr = []
  new_str = ''
  0.upto(str.size - 1) do |count|
    new_str += "#{str[count]}"
    new_arr << new_str
  end
  new_arr
end

substrings_at_start('jeff')
# ["j", "je", "jef", "jeff"]


# def substrings_at_start(string)
#   result = []
#   0.upto(string.size - 1) do |index|
#     result << string[0..index]
#   end
#   result
# end