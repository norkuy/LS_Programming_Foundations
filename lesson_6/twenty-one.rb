PLAY_UNTIL = 21
HIT_UNTIL = 17

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
  if total + 11 > PLAY_UNTIL
    1
  else
    11
  end
end

def remove_empty_cards(deck)
  deck.delete_if { |card| card[1].empty? }
end

def pick_card(deck)
  card = deck.sample
  number = card[0]
  suits = deck[deck.index(card)][1].delete(card[1].sample)
  remove_empty_cards(deck)
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

def busted?(total)
  total > PLAY_UNTIL
end

def update_screen(players_cards, dealers_cards, scores, show_cards)
  if show_cards
    puts "Dealer cards are: #{dealers_cards} Total: #{total(dealers_cards)}"
  else
    puts "Dealer cards are: #{dealers_cards[1]} and unknown card(s)"
  end
  puts "Player cards are: #{players_cards} Total: #{total(players_cards)}"
  puts "Player score: #{scores[:player]} Dealer score: #{scores[:dealer]}"
  puts "--------------"
end

def dealer_turn(dealers_cards, deck)
  until total(dealers_cards) >= HIT_UNTIL
    puts "Dealer hits"
    assign_cards(dealers_cards, deck)
  end
end

def win(winner, score)
  if winner == :player
    score[:player] += 1
  else
    score[:dealer] += 1
  end
end

loop do
  scores = { :player => 0, :dealer => 0 }
  loop do
    players_cards = {}
    dealers_cards = {}
    player_total = total(players_cards)
    dealer_total = total(dealers_cards)
    bust_or_win = false
    deck = init_deck

    assign_cards(players_cards, deck)
    assign_cards(dealers_cards, deck)
    assign_cards(dealers_cards, deck)

    loop do
      update_screen(players_cards, dealers_cards, scores, false)
      puts '(h)it or (s)tay'
      answer = gets.chomp

      if answer == 'hit'
        puts "Player hits"
        assign_cards(players_cards, deck)
        player_total = total(players_cards)
      elsif answer == 'stay'
        puts "Player stays"
        break
      end

      if busted?(player_total)
        puts "Player busted! Dealer wins!"
        bust_or_win = true
        win(:dealer, scores)
        break
      elsif player_total == PLAY_UNTIL
        puts "Player has #{PLAY_UNTIL}!"
        bust_or_win = true
        win(:player, scores)
        break
      end
    end
    # If player did not bust or reach 21, dealer turn.
    if !bust_or_win
      if dealer_total < HIT_UNTIL
        dealer_turn(dealers_cards, deck)
      end
      dealer_total = total(dealers_cards)

      if busted?(dealer_total)
        puts "Dealer busted! Player wins!"
        bust_or_win = true
        win(:player, scores)
      elsif dealer_total == PLAY_UNTIL
        puts "Dealer has #{PLAY_UNTIL}!"
        bust_or_win = true
        win(:dealer, scores)
      end
    end

    # If Neither player nor dealer busted or reached 21, decide winner
    if !bust_or_win
      if total(players_cards) > total(dealers_cards)
        puts "Player won!"
        win(:player, scores)
      elsif total(dealers_cards) > total(players_cards)
        puts "Dealer won!"
        win(:dealer, scores) 
      elsif total(players_cards) == total(dealers_cards)
        puts "It's a tie!" 
      end
    end

    update_screen(players_cards, dealers_cards, scores, true)

    break if scores[:dealer] == 5 || scores[:player] == 5
    
      puts 'play again?'
      play_again = gets.chomp.downcase

    break unless play_again.start_with?('y')
  end
   play_again = 'n' if play_again.nil?
   break if scores[:dealer] == 5 || scores[:player] == 5 || !play_again.start_with?('y') 
end
puts "Thank you for playing!"