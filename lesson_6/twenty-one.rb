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

  card = deck.sample
  number = card[0]
  suite = deck[deck.index(card)][1].delete(card[1].sample)
  
  [number, suite]
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

def update_screen(players_cards, dealers_cards, total)
  system 'clear'
  puts "Computer: #{dealers_cards}"
  puts "Player: #{players_cards} Total: #{total(players_cards)}"
  puts '(h)it or (s)tay'
end


loop do
  play_again = ''
  players_cards = {}
  dealers_cards = {}
  player_index = 1
  dealer_index = 1
  deck = init_deck
  assign_cards(players_cards, deck)
  assign_cards(dealers_cards, deck)
  assign_cards(dealers_cards, deck)
  loop do
    update_screen(players_cards, dealers_cards, deck)
    answer = gets.chomp

    players_cards["Card #{player_index += 1}"] = pick_card(deck, player) if answer == 'hit'
    
    if answer == 'stay'
      puts "Player stays with a total of #{total(players_cards)}"
      until total(dealers_cards) >= 17 do
        dealers_cards["Card #{dealer_index += 1}"] = pick_card(deck)
      end
      puts "Dealer busted with #{total(dealers_cards)}! Player wins!"
      update_screen(players_cards, dealers_cards, deck)
    elsif busted?(players_cards)
      update_screen(players_cards, dealers_cards, deck)
      puts "Player busted with #{total(players_cards)}! Dealer wins!"
      puts "Play another game? (y/n)"
      play_again = gets.chomp.downcase
      break if play_again.start_with?('y')
      break if play_again.start_with?('n')
    end   
  end
  break if play_again.start_with?('n')
end

