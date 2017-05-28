def diamond(num)
  top = 0
  spaces = num / 2 + 1
  while top <= num
    spaces -= 1 if top.odd?
    puts " " * (spaces) + "*" * top if top.odd?
    top += 1
  end
  bottom = num - 2
  while bottom >= 0
    spaces += 1 if bottom.odd?
    puts " " * (spaces) + "*" * bottom if bottom.odd?
    bottom -= 1
  end
end

diamond(13)