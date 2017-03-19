['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# returns 2; 2 out of 3 of the strings in the array are less than
# 4 characters