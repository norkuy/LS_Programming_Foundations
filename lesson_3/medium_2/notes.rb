def fun_with_ids
  a_outer = 42 
  a_outer_id = a_outer.object_id 
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." # 42, 85

  1.times do
    a_outer = 22
  end
  # a_outer = 22
  # a_outer_id = 85
  # a_outer.object_id = 45
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."

end

fun_with_ids
