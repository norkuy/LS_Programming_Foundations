[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# Block's return value is [true, false, true] and any?
# would return true because atleast one element in the
# block's return value is true. any? only iterates once
# because the first element evaluates to true and can
# therefore stop.