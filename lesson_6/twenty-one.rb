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



# sorted = player_or_dealer.sort_by do |k, v|
#       if v[0] == 'A'
#         1
#       else
#         -1
#       end
#     end

# sorted.each do |k, v|
#   if 
# end

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

def update_screen(players_cards, dealers_cards, total)
  system 'clear'
  puts "Computer: #{dealers_cards}"
  puts "Player: #{players_cards} Total: #{total(players_cards)}"
  puts '(h)it or (s)tay'
end


loop do
  players_cards = {}
  dealers_cards = {}
  player_index = 1
  dealer_index = 1
  starter_deck = init_deck
  players_cards["Card #{player_index}"] = pick_card(starter_deck)
  dealers_cards["Card #{dealer_index}"] = pick_card(starter_deck)
  dealers_cards["Card #{dealer_index += 1}"] = pick_card(starter_deck)
  loop do
    update_screen(players_cards, dealers_cards, starter_deck)
    answer = gets.chomp

    if answer == 'hit'
      players_cards["Card #{player_index += 1}"] = pick_card(starter_deck)
    end
    
    if answer == 'stay'
      puts "Player stays with a total of #{total(players_cards)}"
    elsif busted?(players_cards)
      puts "Player busted with #{total(players_cards)}! Dealer wins!"
      puts "Play another game? (y/n)"
      play_again = gets.chomp.downcase
      break if play_again.start_with?('y')
    end   
  end

end
puts "player busted"
