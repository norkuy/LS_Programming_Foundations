def repeater(str)
  new_str = ''
  str.chars.each do |char|
    new_str += char * 2
  end
  puts new_str
end

repeater('jeff is wealthy')