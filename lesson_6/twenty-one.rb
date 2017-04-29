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

def update_screen(p_cards, d_cards, p_total, d_total, show_d_cards)
  if show_d_cards
    puts "Dealer cards are: #{d_cards} Total: #{d_total}"
  else
    puts "Dealer cards are: #{d_cards[1]} and unknown card(s)"
  end
  puts "Player cards are: #{p_cards} Total: #{p_total}"
  puts "--------------"
end

def dealer_turn(d_cards, deck)
  until total(d_cards) >= HIT_UNTIL
    puts "Dealer hits"
    assign_cards(d_cards, deck)
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
  score = { player: 0, dealer: 0 }
  loop do
    p_cards = {}
    d_cards = {}
    p_total = total(p_cards)
    d_total = total(d_cards)
    bust_or_win = false
    deck = init_deck

    assign_cards(p_cards, deck)
    assign_cards(d_cards, deck)
    assign_cards(d_cards, deck)
    p_total = total(p_cards)

    loop do
      update_screen(p_cards, d_cards, p_total, d_total, false)
      puts '(h)it or (s)tay'
      answer = gets.chomp

      if answer == 'hit'
        puts "Player hits"
        assign_cards(p_cards, deck)
        p_total = total(p_cards)
      elsif answer == 'stay'
        puts "Player stays"
        break
      end

      if busted?(p_total)
        puts "Player busted! Dealer wins!"
        bust_or_win = true
        win(:dealer, score)
        break
      elsif p_total == PLAY_UNTIL
        puts "Player has #{PLAY_UNTIL}!"
        bust_or_win = true
        win(:player, score)
        break
      end
    end
    # If player did not bust or reach 21, dealer turn.
    if !bust_or_win
      if d_total < HIT_UNTIL
        dealer_turn(d_cards, deck)
      end
      d_total = total(d_cards)

      if busted?(d_total)
        puts "Dealer busted! Player wins!"
        bust_or_win = true
        win(:player, score)
      elsif d_total == PLAY_UNTIL
        puts "Dealer has #{PLAY_UNTIL}!"
        bust_or_win = true
        win(:dealer, score)
      end
    end

    # If Neither player nor dealer busted or reached 21, decide winner
    if !bust_or_win
      if p_total > d_total
        puts "Player won!"
        win(:player, score)
      elsif d_total > p_total
        puts "Dealer won!"
        win(:dealer, score)
      elsif p_total == d_total
        puts "It's a tie!"
      end
    end

    update_screen(p_cards, d_cards, p_total, d_total, true)
    puts "Player: #{score[:player]}, Dealer: #{score[:dealer]}"

    break if score[:dealer] == 5 || score[:player] == 5
    puts 'play again?'
    play_again = gets.chomp.downcase

    break unless play_again.start_with?('y')
  end
  play_again = 'n' if play_again.nil?
  if score[:dealer] == 5 || score[:player] == 5 || !play_again.start_with?('y')
    break
  end
end
puts "Thank you for playing!"
