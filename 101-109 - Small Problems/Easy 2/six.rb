i = 1
while i <= 99
 puts i if i % 2 == 1
 i += 1
end

(1..99).each do |num|
  puts num if num.odd?
end


