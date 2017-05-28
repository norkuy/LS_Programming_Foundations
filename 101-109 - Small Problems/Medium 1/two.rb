def rotate(input, n)
  new_str = ''
  input = input.to_s
  last = input.slice(input.length - n, n)
  i = 0
  loop do
    last[i], last[i + 1] = last[i + 1], last[i]
    break if i = last.length
    i += 1
  end
  input.slice(0, input.length - n) + last
end

