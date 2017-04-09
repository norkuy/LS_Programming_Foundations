INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
FIRST_MOVE = 'CHOOSE'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
    [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, scores)
  # system 'clear'
  puts "Player Wins: #{scores[:player]} Computer Wins: #{scores[:computer]}"
  puts "You're #{PLAYER_MARKER} Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+------"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def pick_connectors!(delimiter, join_word)
  if join_word.empty?
    join_word << 'or'
  end

  if delimiter.empty?
    delimiter << ','
  end
end

def joinor(open_spaces, delimiter = '', join_word = '')

  pick_connectors!(delimiter, join_word)

  if open_spaces.count > 2
      open_spaces.map.with_index do |num, index|
        if index < open_spaces.size - 1
          "#{num}#{delimiter} "
        else
          "#{join_word} #{num}"
        end
      end.join
  elsif open_spaces.count == 2
    open_spaces.join(" #{join_word} ")
  elsif open_spaces.count == 1
    open_spaces.first
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_random_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
  puts "RANDOM"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def win_counter(winner, scores)
  if winner == 'Player'
    scores[:player] += 1
  elsif winner == 'Computer'
    scores[:computer] += 1
  end
  scores
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def computer_defense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      line.each do |square|
        if brd[square] == INITIAL_MARKER
        puts "DEFENSIVE"
        return square
        end
      end
    end 
  end
  nil
end

def computer_offense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      line.each do |square|
        if brd[square] == INITIAL_MARKER
          puts "OFFENSIVE"
          return square
        end
      end
    end 
  end
  nil
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd) 
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def computer_pick_center(brd)
  if brd[5] == INITIAL_MARKER
    puts "PICKED 5"
    return 5
  end
  nil
end

def computer_places_piece!(brd)
  if computer_offense(brd) # if true use square return value
    brd[computer_offense(brd)] = COMPUTER_MARKER
  elsif computer_defense(brd)
    brd[computer_defense(brd)] = COMPUTER_MARKER
  elsif computer_pick_center(brd)
    brd[computer_pick_center(brd)] = COMPUTER_MARKER
  else
    computer_random_piece!(brd)
  end
end

def first_player_to_move
  selection = ''
  if FIRST_MOVE == 'CHOOSE'
    loop do
    prompt "'computer' or 'player' goes first until 5 wins. Or 'q' to quit program"
    selection = gets.chomp.downcase
    break if selection == 'computer' || selection == 'player' || selection == 'q'
    end
    selection
  elsif FIRST_MOVE == 'COMPUTER'
    'computer'
  elsif FIRST_MOVE == 'PLAYER'
    'player'
  end
end

loop do
scores = { player: 0, computer: 0 }
current_player = first_player_to_move
break if current_player == 'q'
loop do
  board = initialize_board

  loop do
    display_board(board, scores)
    place_piece!(board, current_player)    
    current_player == 'player' ? current_player = 'computer' : current_player = 'player' 
    break if someone_won?(board) || board_full?(board)
  end

  win_counter(detect_winner(board), scores)
  display_board(board, scores)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  if scores[:player] == 5
    prompt "Player has reached 5 wins!"
    break
  elsif scores[:computer] == 5
    prompt "Computer has reached 5 wins!"
    break
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

end



prompt "Thanks for playing Tic Tac Toe Goodbye!"

