def double_consonants(str)
  new_str = ''
  str.chars.each do |char|
    if char =~ /[bcdfghjklmnpqrstvwxyz]/i
      new_str += char * 2
    else
      new_str += char
    end
  end
    puts new_str
end

double_consonants('this is BBB a sentence')