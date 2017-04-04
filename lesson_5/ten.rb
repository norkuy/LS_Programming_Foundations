[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# my answer

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |outer_hash|
  outer_hash.each_with_object({}) do |(k,v), hash|
    hash[k] = v + 1
  end
end


# answer 1

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# answer 2

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end