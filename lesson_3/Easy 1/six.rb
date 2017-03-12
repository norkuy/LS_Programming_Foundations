famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

famous_words << "seven years ago"

famous_words.insert(0, 'Four scores and ')

famous_words.prepend('Four scores and ')