DEGREE = "\x00\xB0"
MINUTES = 60
SECONDS = 60
DEGREES = MINUTES * SECONDS

def dms(num)
  
  
  string_num = num.to_s

  if string_num.start_with?('-')
    sign = string_num[0]
    string_num[0] = ''
  else
    sign = ''
  end

  num = string_num.to_f

  total_seconds = num * DEGREES
  
  string_num.split('.')

  total_minutes, seconds = total_seconds.divmod(60)
        degrees, minutes = total_minutes.divmod(60)
    
  
  puts format(%(#{sign}%02d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end

dms(-319.23901998)


