def uppercase?(str)
  letters_only = str.gsub(/\W+/, '')
  letters_only.chars.all? do |char|
    char == char.upcase
  end
end