def calculate_bonus(salary, bool)
  bool ? salary / 2 : 0
end

calculate_bonus(5000, false)