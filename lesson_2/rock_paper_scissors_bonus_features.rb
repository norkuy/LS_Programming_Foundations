VALID_CHOICES = %w(rock paper scissors spock lizard)

scores = { player: 0, computer: 0 }

win_combos = [
  ['rock', 'scissors'],
  ['paper', 'rock'],
  ['scissors', 'paper'],
  ['rock', 'lizard'],
  ['lizard', 'spock'],
  ['spock', 'scissors'],
  ['scissors', 'lizard'],
  ['lizard', 'paper'],
  ['paper', 'spock'],
  ['spock', 'rock']
]

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second, combos)
  if combos.include?([first, second])
    "player"
  elsif combos.include?([second, first])
    "computer"
  end
end

def display_results(winner)
  if winner == "player"
    puts "Player won!"
  elsif winner == "computer"
    puts "Computer won!"
  else
    puts "It's a tie"
  end
end

def win_counter(scores, winner)
  if winner == "player"
    scores[:player] = scores[:player] + 1
  elsif winner == "computer"
    scores[:computer] = scores[:computer] + 1
  end
  puts "player wins: #{scores[:player]}; computer wins: #{scores[:computer]}"
end

def reached_5?(scores)
  if scores[:player] == 5 || scores[:computer] == 5
    if scores[:player] == 5
      puts "Player has reached 5 wins!"
    elsif scores[:computer] == 5
      puts "Computer has reached 5 wins!"
    end
    true
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    prompt_matches = VALID_CHOICES.select do |word|
      word.start_with?(choice)
    end
    if VALID_CHOICES.include?(choice)
      break
    elsif prompt_matches.length == 1
      choice = prompt_matches[0]
      break
    elsif prompt_matches.length > 1
      prompt("Please be more specific")
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample
  Kernel.puts("You chose: #{choice}; Computer chose #{computer_choice}")

  winner = win?(choice, computer_choice, win_combos)
  display_results(winner)

  win_counter(scores, winner)
  break if reached_5?(scores)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing, Goodbye!")
