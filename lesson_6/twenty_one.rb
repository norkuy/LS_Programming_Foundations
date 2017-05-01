PLAY_UNTIL = 21
HIT_UNTIL = 17

def init_deck
  deck = []
  card_values = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  suits = ["S", "H", "D", "C"]
    card_values.each do |card|
      suits.each do |suit|
        deck << [card, suit]
      end
    end
  deck.shuffle
end

def total(player_or_dealer)
  total = 0
  player_or_dealer.each do |card|
    card_value = card[0]
    if card_value == 'A'
      card_value = calculate_ace(total)
    elsif card_value == 'J' || card_value == 'Q' || card_value == 'K'
      card_value = 10
    end
    total += card_value
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

def pick_card(deck)
  deck.pop
end

def assign_cards(user, deck)
  user << pick_card(deck)
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

def win_counter(user, scores)
  if user == :player
    scores[:player] += 1
  else
    scores[:dealer] += 1
  end
end

def play_again?
  prompt 'play again?'
  play_again = gets.chomp
  play_again.downcase.start_with?('y')
end

def show_scores(scores)
  prompt "Player: #{scores[:player]} Dealer: #{scores[:dealer]}"
end

def prompt(msg)
  puts "=> #{msg}"
end

loop do
  scores = { player: 0, dealer: 0 }
  loop do
    # init cards, totals, deck, and assign cards
    p_cards = []
    d_cards = []
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
        win_counter(:dealer, scores)
        break
      end
    end

    if busted?(p_total)
      # Calculate dealer total since game is over.
      d_total = total(d_cards)
      show_cards(p_cards, d_cards, p_total, d_total, true)
      show_scores(scores)
      break if scores[:dealer] == 5 || scores[:player] == 5
      play_again? ? next : break
    end
    # Player didn't bust, dealer turn.
    if d_total < HIT_UNTIL
      dealer_turn(d_cards, deck)
    end
    d_total = total(d_cards)

    if busted?(d_total)
      prompt "Dealer busted! Player wins!"
      win_counter(:player, scores)
      show_cards(p_cards, d_cards, p_total, d_total, true)
      show_scores(scores)
      break if scores[:dealer] == 5 || scores[:player] == 5
      play_again? ? next : break
    end

    # No bust from player or dealer, decide win_counterner.
    if p_total == PLAY_UNTIL && d_total != PLAY_UNTIL
      prompt "Player reached #{PLAY_UNTIL}!"
      win_counter(:player, scores)
    elsif d_total == PLAY_UNTIL && p_total != PLAY_UNTIL
      prompt "Dealer reached #{PLAY_UNTIL}!"
      win_counter(:dealer, scores)
    elsif p_total > d_total
      prompt "Player won!"
      win_counter(:player, scores)
    elsif d_total > p_total
      prompt "Dealer won!"
      win_counter(:dealer, scores)
    elsif p_total == d_total
      prompt "It's a tie!"
    end

    show_cards(p_cards, d_cards, p_total, d_total, true)
    show_scores(scores)
    break if scores[:dealer] == 5 || scores[:player] == 5
    break unless play_again?
  end
  if scores[:dealer] == 5 || scores[:player] == 5 || !play_again?
    break
  end
end
prompt "Thank you for playing!"
