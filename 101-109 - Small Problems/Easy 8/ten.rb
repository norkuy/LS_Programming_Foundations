def center_of(str)
  puts "#{str[str.size / 2]}" if str.size.odd?
  puts "#{str[(str.size / 2) - 1]}#{str[str.size / 2]}" if str.size.even?
end

center_of('Launchschool')