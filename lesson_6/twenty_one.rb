PLAY_UNTIL = 21
HIT_UNTIL = 17

def init_deck
  deck = []
  i = 1
  j = 0
  special_cards = ['J', 'Q', 'K', 'A']
  (0..12).each do |card|
    if card >= 9
      deck[card] = [special_cards[j], ["♠", "♥", "♦", "♣"]]
      j += 1
    else
      deck[card] = [i += 1, ["♠", "♥", "♦", "♣"]]
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

def show_cards(p_cards, d_cards, p_total, d_total, show_d_cards)
  if show_d_cards
    prompt "Dealer cards are: #{d_cards} Total: #{d_total}"
  else
    prompt "Dealer cards are: #{d_cards[1]} and unknown card(s)"
  end
  prompt "Player cards are: #{p_cards} Total: #{p_total}"
  prompt "=========="
end

def dealer_turn(d_cards, deck)
  until total(d_cards) >= HIT_UNTIL
    prompt "Dealer hits"
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

def play_again?
  prompt 'play again?'
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end

def show_score(score)
  prompt "Player: #{score[:player]} Dealer: #{score[:dealer]}"
end

def prompt(msg)
  puts "=> #{msg}"
end

loop do
  score = { player: 0, dealer: 0 }
  loop do
    # init cards, totals, deck, and assign cards
    p_cards = {}
    d_cards = {}
    p_total = 0
    d_total = 0
    deck = init_deck
    assign_cards(p_cards, deck)
    assign_cards(d_cards, deck)
    assign_cards(d_cards, deck)
    p_total = total(p_cards)
    # Player turn until bust or stay
    loop do
      show_cards(p_cards, d_cards, p_total, d_total, false)
      prompt '(h)it or (s)tay'
      answer = gets.chomp

      if answer.downcase.start_with?('h')
        prompt "Player hits"
        assign_cards(p_cards, deck)
        p_total = total(p_cards)
      elsif answer.downcase.start_with?('s')
        prompt "Player stays"
        break
      end

      if busted?(p_total)
        prompt "Player busted! Dealer wins!"
        win(:dealer, score)
        break
      end
    end

    if busted?(p_total)
      # Calculate dealer total since game is over.
      d_total = total(d_cards)
      show_cards(p_cards, d_cards, p_total, d_total, true)
      show_score(score)
      break if score[:dealer] == 5 || score[:player] == 5
      play_again? ? next : break
    end
    # Player didn't bust, dealer turn.
    if d_total < HIT_UNTIL
      dealer_turn(d_cards, deck)
    end
    d_total = total(d_cards)

    if busted?(d_total)
      prompt "Dealer busted! Player wins!"
      win(:player, score)
      show_cards(p_cards, d_cards, p_total, d_total, true)
      show_score(score)
      break if score[:dealer] == 5 || score[:player] == 5
      play_again? ? next : break
    end

    # No bust from player or dealer, decide winner.
    if p_total == PLAY_UNTIL && d_total != PLAY_UNTIL
      prompt "Player reached #{PLAY_UNTIL}!"
      win(:player, score)
    elsif d_total == PLAY_UNTIL && p_total != PLAY_UNTIL
      prompt "Dealer reached #{PLAY_UNTIL}!"
      win(:dealer, score)
    elsif p_total > d_total
      prompt "Player won!"
      win(:player, score)
    elsif d_total > p_total
      prompt "Dealer won!"
      win(:dealer, score)
    elsif p_total == d_total
      prompt "It's a tie!"
    end

    show_cards(p_cards, d_cards, p_total, d_total, true)
    show_score(score)
    break if score[:dealer] == 5 || score[:player] == 5
    break unless play_again?
  end
  if score[:dealer] == 5 || score[:player] == 5 || !play_again?
    break
  end
end
prompt "Thank you for playing!"
