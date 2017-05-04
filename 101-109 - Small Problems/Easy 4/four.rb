def leap_year?(year)
  if year <= 1752
    return true if year % 4 == 0
  else
    return true if year % 4 == 0 unless year % 100 == 0
    return true if year % 100 == 0 && year % 400 == 0
  end
end

