# Let's now take a look at an example with hashes. In this # example we want to select the key-value pairs where the #value is 'Fruit'.

def select_fruit(produce)
  
new_hash = {}
counter = 0
produce_keys = produce.keys 

while counter <= produce_keys.size - 1
  specific_key = produce_keys[counter]
  produce_val =  produce[specific_key]
  if produce_val == "Fruit"
    new_hash[specific_key] = produce_val
  end
  counter += 1
end
  new_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

select_fruit(produce)