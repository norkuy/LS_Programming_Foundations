def rotate(input)
  new_str = ''
  first = input.to_s.slice(0,1)
  new_str = input.to_s.slice(1, input.to_s.length) + first
end

rotate(50043)
