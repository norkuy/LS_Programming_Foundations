def init_deck
  deck = []
  i = 1
  j = 0
  special_cards = ['J', 'Q', 'K', 'A']
  (0..12).each do |card|
    if card >= 9
      deck[card] = [special_cards[j], ["\u2665", "\u2666", "\u2663", "\u2660"]]
      j += 1
    else   
      deck[card] = [i += 1, ["\u2665", "\u2666", "\u2663", "\u2660"]]
    end
  end
  deck
end


def total(player_or_dealer)
  total = 0

player_or_dealer.each do |_, v|
  card_val = v[0]
  if card_val == 'A'
    card_val = calculate_ace(total)
  elsif card_val == 'J' || card_val == 'Q' || card_val == 'K'
    card_val = 10
  end
  total += card_val
  end
  total
end

def calculate_ace(total)
  if total + 11 > 21
    ace = 1
  else
    ace = 11
  end
  ace
end

def remove_cards(deck)
  deck.delete_if { |card| card[1].empty? }
end

def pick_card(deck)
  remove_cards(deck)
  card = ''
  loop do
    card = deck.sample
    break if card[1].any?
  end

  number = card[0]
  suits = deck[deck.index(card)][1].delete(card[1].sample)
  
  [number, suits]
end


def assign_cards(user, deck)
  index = 1
  loop do
    if user[index].nil?
      user[index] = pick_card(deck)
      break
    end
  index += 1
  end
end

def busted?(cards)
  total(cards) > 21
end

def update_screen(players_cards, dealers_cards, message, show_cards)
  system 'clear'
  if show_cards
    puts "Computer: #{dealers_cards}"
  else   
    puts "Computer: #{dealers_cards[1]} and unknown card(s)" 
  end
  puts "Player: #{players_cards} Total: #{total(players_cards)}"
  puts message
end

def dealer_turn(dealers_cards, deck)     
  until total(dealers_cards) >= 17 do
    assign_cards(dealers_cards, deck)
  end
end

loop do

  play_again = ''
  bust_or_win = false
  message = 'Welcome!'
  players_cards = {}
  dealers_cards = {}
  deck = init_deck

  assign_cards(players_cards, deck)
  assign_cards(dealers_cards, deck)
  assign_cards(dealers_cards, deck)

  loop do

    update_screen(players_cards, dealers_cards, message, false)
    puts '(h)it or (s)tay'
    answer = gets.chomp

  if answer == 'hit'
    message = 'Player hits'
    assign_cards(players_cards, deck)
  elsif answer == 'stay'
     break
  end

  if busted?(players_cards)
      message = 'Player busted! Dealer wins!'
      bust_or_win = true
      break
  elsif total(players_cards) == 21
      message = 'Player has 21!'
      bust_or_win = true
      break
  end
end
  
  if !bust_or_win
  
  if total(dealers_cards) < 17
    dealer_turn(dealers_cards, deck) 
  end

  if busted?(dealers_cards)
    message = 'Dealer busted! Player wins!' 
    bust_or_win = true
  elsif total(dealers_cards) == 21
    message = 'Dealer has 21!'
    bust_or_win = true
  end
  end

  if !bust_or_win
  message = 'Player won!' if total(players_cards) > total(dealers_cards)
  message = 'Dealer won!' if total(dealers_cards) > total(players_cards)
  message = "It's a tie!" if total(players_cards) == total(dealers_cards)
  end

  update_screen(players_cards, dealers_cards, message, true)

  puts 'play again?'
  play_again = gets.chomp.downcase
  break unless play_again.start_with?('y')


end



