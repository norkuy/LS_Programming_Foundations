['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# returns the updated hash passed in with the key being the
# first letter of each value so {'a' => 'ant'} for example.

