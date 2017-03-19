flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# my answer
flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end

# OR

# answer
flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end