hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot', 'fruit' => 'pear' }

# (irb):1: warning: key :fruit is duplicated and overwritten on line 1
# => {:fruit=>"pear", :vegetable=>"carrot"}
# 'fruit' => 'pear' overwrites the first 'fruit' => 'apple' value because
# there are duplicate 'fruit' keys