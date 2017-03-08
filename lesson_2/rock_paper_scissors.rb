VALID_CHOICES = %w(rock paper scissors)

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
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    puts "You won!"
  elsif win?(player, computer)
    puts "Computer Won!"
  else
    puts "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample
  Kernel.puts("You chose: #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing, Goodbye!")
