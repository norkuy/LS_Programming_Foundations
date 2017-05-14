def crunch(str)
  new_str = ''
  str.chars.chunk { |group| group }.each do |grouped|
    new_str += grouped[0]
  end
  new_str
end

def crunch(str)
  new_str = ''
  str.chars.each_with_index do |char, index|
    new_str += char unless char == str[index + 1]
  end
  new_str
end


crunch('dddaaiily doouubbbbbblleee')
