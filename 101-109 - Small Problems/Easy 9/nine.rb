def get_grade(grade1, grade2, grade3)

avg =  (grade1 + grade2 + grade3) / 3

case 
when avg >= 90 
  puts "A"
when avg >= 80 && avg < 90
  puts "B"
when avg >= 70 && avg < 80
  puts "C"
when avg >= 60 && avg < 70
  puts "D"
when avg >= 0 && avg < 60
  puts "F"
end

end

get_grade(60, 75, 120)


def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end