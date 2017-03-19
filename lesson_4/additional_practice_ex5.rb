flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# my answer
starts_with_be = ''
flintstones.each_with_index do |name, index|
  if name.start_with?('Be')
    starts_with_be = index
  end
end
puts starts_with_be

# answer
flintstones.index { |name| name[0, 2] == "Be" }