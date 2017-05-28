def triangle(side1, side2, side3)
  triangle = [side1, side2, side3].sort

  too_small = [triangle[0], triangle[1]].reduce(:+) < triangle[2]

  if triangle.any? { |side| side == 0 } ||  too_small
    :invalid
  elsif triangle.uniq.size == 1
    :equilateral
  elsif triangle.uniq.size == 2
    :isosceles
  elsif triangle.uniq.size == triangle.size
    :scalene
  end
end

triangle(8, 1, 6)