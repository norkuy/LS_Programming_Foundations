def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  # a_outer is 42 with an id of: 85 before the block.
  # b_outer is forty two with an id of: 2152753560 before the block.
  # c_outer is [42] with an id of: 2152753540 before the block.
  # d_outer is 42 with an id of: 85 before the block.

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  # a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
  # b_outer is forty two with an id of: 2152753560 BEFORE and: 2152753560 AFTER the method call.
  # c_outer is [42] with an id of: 2152753540 BEFORE and: 2152753540 AFTER the method call.
  # d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call.
  
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"

  # no access to inner variables from outside method
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
  a_outer_inner_id = a_outer.object_id
  b_outer_inner_id = b_outer.object_id
  c_outer_inner_id = c_outer.object_id
  d_outer_inner_id = d_outer.object_id

  # a_outer id was 85 before the method and is: 85 inside the method.
  # b_outer id was 2152753560 before the method and is: 2152753560 inside the method.
  # c_outer id was 2152753540 before the method and is: 2152753540 inside the method.
  # d_outer id was 85 before the method and is: 85 inside the method.
  # This is also the same as before. These "outers" are NOT the same variables as those outside, Ruby is simply re-using the objects,
  # as these new variables have the same values as the ones outside.
  # References and reference values are passed in?
  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

  a_outer = 22
  b_outer = "thirty three"
  # c_outer = [44]
  c_outer[0] = [44]
  d_outer = c_outer[0]

  # a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after.
  # b_outer inside after reassignment is thirty three with an id of: 2152753560 before and: 2152752300 after.
  # c_outer inside after reassignment is [44] with an id of: 2152753540 before and: 2152752280 after.
  # d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after.

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  # a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer).
  # b_inner is thirty three with an id of: 2152752300 inside the method (compared to 2152752300 for outer).
  # c_inner is [44] with an id of: 2152752280 inside the method (compared to 2152752280 for outer).
  # d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer).

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
end