VALID_CHOICES = %w(rock paper scissors spock lizard)
$player_win = 0
$computer_win = 0

def test_method
  prompt('test message')
end

# test_method is beginning called before prompt is defined
# an error will be raised.

# test_method

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method is will run in this scenario
# test_method

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock') 
end

def increase_win_count(winner)
  if winner == 'player'
    $player_win = $player_win + 1
  else
    $computer_win = $computer_win + 1
  end
  puts "players wins: #{$player_win}; computer wins: #{$computer_win}"
end

def reached_5?
  if $player_win == 5 || $computer_win == 5
    puts "Game Over!"
    return true
  end
end

def display_results(player, computer)
  if win?(player, computer)
    puts "You won!"
    increase_win_count('player')
  elsif win?(computer, player)
    puts "Computer Won!"
    increase_win_count('computer')
  else
    puts "It's a tie!"
  end
end

loop do
  choice = ''
  does_input_match = ''
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
      prompt("More than one choice includes your selection")
    else
      prompt("That's not a valid choice")
    end
  end
  computer_choice = VALID_CHOICES.sample
  Kernel.puts("You chose: #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  # if $player_win == 5
  #   puts "Player has reached 5 wins!"
  #   break
  # elsif $computer_win == 5
  #   puts "Computer has reached 5 wins!"
  #   break
  # end

  break if reached_5?

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing, Goodbye!")
