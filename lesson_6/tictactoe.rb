require 'pry'

INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "0"

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
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

def initialize_board
 new_board = {}
 (1..9).each { |num| new_board[num] = INITIAL_MARKER}
 new_board
end 

board = initialize_board
display_board(board)

def empty_squares(brd)
  binding.pry
  brd.keys.select {|num| brd[num] = INITIAL_MARKER}
end


def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  binding.pry
  brd[square] = PLAYER_MARKER
  binding.pry
end

player_places_piece!(board)
puts board.inspect
display_board(board)
