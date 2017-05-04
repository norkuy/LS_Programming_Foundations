name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# BOB
# BOB

# upcase! mutates the string into BOB, altering save_name and name.
