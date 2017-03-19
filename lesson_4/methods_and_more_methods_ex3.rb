[1, 2, 3].reject do |num|
  puts num
end

# puts returns nil which means false and reject returns
# values that are false so [1, 2, 3] would be returned
