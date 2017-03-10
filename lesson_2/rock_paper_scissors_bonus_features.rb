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
  Kernel.puts("=> #{message}")
end


def win?(combos, first, second)
  if first != second 
    return combos.any? do |combo|
      combo == [first, second]
    end 
  end
end

def display_results(first, second, combos = []) 
    if first == second
      puts "It's a tie!"
    elsif win?(combos, first, second)
      puts "Player won!"
    elsif win?(combos, first, second) == false
      puts "Computer won!"
    end
end

  # (first == 'rock' && second == 'scissors') ||
  #   (first == 'paper' && second == 'rock') ||
  #   (first == 'scissors' && second == 'paper') ||
  #   (first == 'rock' && second == 'lizard') ||
  #   (first == 'lizard' && second == 'spock') ||
  #   (first == 'spock' && second == 'scissors') ||
  #   (first == 'scissors' && second == 'lizard') ||
  #   (first == 'lizard' && second == 'paper') ||
  #   (first == 'paper' && second == 'spock') ||
  #   (first == 'spock' && second == 'rock')



def win_counter(player, computer, scores, combos = [])
  if win?(combos, player, computer)
    scores[:player] = scores[:player] + 1
  elsif win?(combos, player, computer) == false
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

  display_results(choice, computer_choice, win_combos)

  win_counter(choice, computer_choice, scores, win_combos)
  
  break if reached_5?(scores)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing, Goodbye!")
