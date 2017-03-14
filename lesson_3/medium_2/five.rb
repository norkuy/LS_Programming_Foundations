def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# Shortened version of code. If statement will return
# true automatically
def color_valid(color)
  color == "blue" || color == "green"
end