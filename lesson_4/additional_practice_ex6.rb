flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# my answer
flintstones.each_with_index do |name, index|
  flintstones[index] = name.slice!(0, 3)
end

# answer
flintstones.map! do |name|
  name[0, 3]
end

