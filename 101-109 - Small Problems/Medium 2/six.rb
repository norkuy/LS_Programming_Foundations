def triangle(side1, side2, side3)
  triangle = [side1, side2, side3]
  
  invalid = triangle.reduce(:+) != 180 || triangle.any? { |side| side == 0 }

  case
  when invalid
    :invalid
  when  triangle.any? { |side| side == 90 }
    :right
  when triangle.all? { |side| side < 90 }
    :acute
  when triangle.any? { |side| side > 90 }
    :obtuse
  end
end

triangle(60,100,20)