def balanced?(str)
  
  str_chars = str.chars
  
  open_brackets_index = str_chars.each_index.select { |i| str_chars[i] == '(' }
  closed_brackets_index = str_chars.each_index.select { |i| str_chars[i] == ')' }
  
  return false if open_brackets_index.size != closed_brackets_index.size

  open_brackets_index.zip(closed_brackets_index).each do |open, close|
    return false if close < open
  end
  true
end

balanced?('this )( ( is a sentence with ) (( many )) parantheses ()')