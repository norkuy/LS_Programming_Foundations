# In the previous exercise we added Dino to our array like this:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push('Dino').push('Hoppy')
flintstones.concat(['Dino', 'Hoppy']) 
flintstones.concat(%w(Dino Hoppy))