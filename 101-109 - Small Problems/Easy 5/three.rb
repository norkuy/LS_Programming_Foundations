MINUTES_PER_HOUR = 60
MINUTES_IN_DAY = MINUTES_PER_HOUR * 24

def after_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  minutes_after_midnight = ((hours * MINUTES_PER_HOUR) + minutes) % MINUTES_IN_DAY
end

puts after_midnight('24:00')

def before_midnight(time)
  hours, minutes = time.split(':').map(&:to_i)
  minutes_before_midnight = MINUTES_IN_DAY - after_midnight(time)
  minutes_before_midnight = 0 if minutes_before_midnight == MINUTES_IN_DAY
end


puts before_midnight('24:00')