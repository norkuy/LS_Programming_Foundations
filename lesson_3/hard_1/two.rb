greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# the output is {:a => "hi there"} because informal_greeting
# is a reference to the original object. If we didn't want
# to modify greetings, we could use:
# informal_greetings = greetings[:a].clone or
# informal_greetings = informal_greetings + ' there' which
# creates a new String object.
