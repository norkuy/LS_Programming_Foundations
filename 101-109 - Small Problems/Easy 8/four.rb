# def substrings_at_start(str)
#   new_arr = []
#   str.chars.each_with_index do |_, index|
#     new_str = ''
#     index.upto(str.size - 1) do |count|
#       new_str += "#{str[count]}"
#       new_arr << new_str
#     end
#   end
#   new_arr
# end


def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(substrings_at_start(this_substring))
  end
  results
end
