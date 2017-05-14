def print_in_box(str)
  top = "+"
  bottom = "+"
  empty = " "
  middle = []
  middle2 = "|"
  middle3 = "|"
  bottom =  "+"
  i = 0
  while i <= str.size
    if i == str.size 
      top += '+'
      bottom += '+'
    else
      top += '**'
      bottom  += '**'
    end
    i += 1
    if i == 40
      top += '+'
      bottom += '+'
      break
    end
  end
  
  if str.size.odd?
    left_pad = (empty * (str.size / 2) + empty) 
  else
    left_pad = (empty * (str.size / 2))
  end
  
  if str.size >= 40
    left_pad = empty * 2
    right_pad = empty * 2
    str_arr = []
    start = 0
    finish = 36
    str_pieces = (str.size / 36.to_f).ceil
    start = 0
    finish = 36
    str_pieces.times do |num|
      str_arr << str.slice(start, finish)
        if num == str_pieces - 1 
          finish = str.size - (36 * (str_pieces - 1))
        end
        start += 36
    end
    p str_arr
  end
  
  right_pad = (empty * (str.size / 2))
  
  str_arr.each_with_index do |str_piece, index|
  middle[index] =  "#{left_pad} #{str_piece} #{right_pad} |"
  end
  
  # middle += left_pad + (empty * str.size) + right_pad + '|'
  middle3 += left_pad + (empty * str.size) + right_pad + '|'
  
  puts top
  i = 0
  until i >= middle.size
    puts middle[i]
    i += 1
  end
  puts middle2
  puts middle3
  puts bottom
end

print_in_box("This is my long sentence written by me on a Wednesday by Jeff. It's really long and profound and makes a lot of sense. Hope this helps. Thank you for listening and GOD SPEED")
