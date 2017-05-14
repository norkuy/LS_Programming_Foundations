def time_of_day(time)

      base_time = time % 1440
            
      hrs = (base_time.to_f / 60).floor
      min = (((base_time.to_f / 60) - hrs) * 60).floor
    
      hrs <= 9 ? hrs = "0#{hrs}" : hrs = "#{hrs}"
      min <= 9 ? min = "0#{min}" : min = "#{min}"
      
      hrs + ":" + min
end

time_of_day(-1)