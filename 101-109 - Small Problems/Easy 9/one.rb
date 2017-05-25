def greetings(arr, hash)
  str = ''
  str += "Hello, #{arr.join(' ')}!" 
  str += "Nice to have a #{hash[:title]} #{hash[:occupation]} around."
  puts str
end
greetings(['Jeff', 'W', "Mignone"], {title: 'Master', occupation: 'Programmer'})