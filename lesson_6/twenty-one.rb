deck = [
       [2, ['H','C','D','S']],
       [3, ['H','C','D','S']],
       [4, ['H','C','D','S']],
       [5, ['H','C','D','S']],
       [6, ['H','C','D','S']],
       [7, ['H','C','D','S']],
       [8, ['H','C','D','S']],
       [9, ['H','C','D','S']],
       [10, ['H','C','D','S']],
       ['J', ['H','C','D','S']],
       ['Q', ['H','C','D','S']],
       ['K', ['H','C','D','S']],
       ['A', ['H','C','D','S']],
       ]

  
def total(player_or_dealer)
  total = 0
  player_or_dealer.each do |k, v|
    card_val = v[0]
    if card_val == 'J' || card_val == 'Q' || card_val == 'K'
      card_val = 10
    elsif card_val == 'A'
      next
    end
    total += card_val
  end
  total
end

def calculate_ace(total)
  if total + 10 > 21
    ace = 1
  else
    ace = 10
  end
  ace
end

def pick_card(deck)

  deck.each do |card|
    if card[1].empty?
      deck.delete(deck.index(card))
    end
  end

  card = deck.sample
  number = card[0]
  suite = deck[deck.index(card)][1].delete(card[1].sample)
  [number, suite]
end

def busted?(cards)
  total(cards) > 21
end

def update_screen(players_cards, dealers_cards)
    system 'clear'
    puts "Computer: #{dealers_cards}"
    puts "Player: #{players_cards}"
    puts '(h)it or (s)tay'
end

loop do
  players_cards = {}
  dealers_cards = {}
  player_index = 1
  dealer_index = 1
  players_cards[player_index] = pick_card(deck)
  dealers_cards[dealer_index] = pick_card(deck)
  dealers_cards[dealer_index += 1] = pick_card(deck)
  loop do
    update_screen(players_cards, dealers_cards)
    puts total(players_cards)
    answer = gets.chomp

    if answer = 'hit'
      players_cards[player_index += 1] = pick_card(deck)
      update_screen(players_cards, dealers_cards)
    end

    break if answer == 'stay' || busted?(players_cards)

  end

end

puts "player busted"
