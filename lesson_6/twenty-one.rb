def init_deck
  deck = []
  i = 1
  j = 0
  special_cards = ['J', 'Q', 'K', 'A']
  (0..12).each do |card|
    if card >= 9
      deck[card] = [special_cards[j], ['H', 'D', 'C', 'S']]
      j += 1
    else   
      deck[card] = [i+=1, ['H', 'D', 'C', 'S']]
    end
  end
  deck
end

def total(player_or_dealer)
  total = 0

 
sorted = player_or_dealer.sort_by do |k, v|
  if v[0] == 'A'
    1
  else
    -1
  end
end

sorted.to_h.each do |k, v|
  card_val = v[0]
  if card_val == 'J' || card_val == 'Q' || card_val == 'K'
    card_val = 10
  elsif card_val == 'A'
    card_val = calculate_ace(total)
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

def pick_card(starter_deck)

  # deck.each do |card|
  #   if card[1].empty?
  #     deck.delete(deck.index(card))
  #   end
  # end

  card = starter_deck.sample
  number = card[0]
  suite = starter_deck[starter_deck.index(card)][1].delete(card[1].sample)
  [number, suite]
end

def busted?(cards)
  total(cards) > 21
end

def update_screen(players_cards, dealers_cards, starter_deck)
  system 'clear'
  puts "Computer: #{dealers_cards}"
  puts "Player: #{players_cards}"
  puts '(h)it or (s)tay'
  p starter_deck
end

loop do
  players_cards = {}
  dealers_cards = {}
  player_index = 1
  dealer_index = 1
  starter_deck = init_deck
  players_cards[player_index] = pick_card(starter_deck)
  dealers_cards[dealer_index] = pick_card(starter_deck)
  dealers_cards[dealer_index += 1] = pick_card(starter_deck)
  loop do
    update_screen(players_cards, dealers_cards, starter_deck)
    puts total(players_cards)
    answer = gets.chomp

    if answer == 'hit'
      players_cards[player_index += 1] = pick_card(starter_deck)
    end

    break if answer == 'stay' || busted?(players_cards)
  end
end
puts "player busted"
