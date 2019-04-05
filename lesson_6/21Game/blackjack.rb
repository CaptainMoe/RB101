require 'pry'

def prompt(msg)
  puts "=>#{msg}"
end

def display_hands(player, dealer)
  system 'clear'
  prompt "Dealer: [ #{dealer[0]}, #{'[unkown card] ' * (dealer.size - 1)}]"
  prompt "Player: #{player}"
end

def initialize_deck()
  deck = []
  SUIT.each do |suit|
    CARD_RANKS.each do |value|
      deck << [suit, value]
    end
  end
  deck.shuffle
end

def deal()
  player = []
  dealer = []

  2.times do
    player << DECK.shift
    dealer << DECK.shift
  end

  return player, dealer
end

def hit(player)
  player << DECK.shift
end

def count_aces(hand)
  num_aces = hand.count do |card|
    card[1] == 'Ace'
  end
  num_aces
end

def card_value(card)
  case card[1]
  when 'Ace' then 11
  when 'Jack' then 10
  when 'Queen' then 10
  when 'King' then 10
  else
    card[1].to_i
  end
end


def hand_value(hand)
  sum = 0
  hand.each do |card|
    sum += card_value(card)
  end
  num_aces = count_aces(hand)
  num_aces.times do
    sum -= 10 if sum > 21
  end
  sum
end

def bust?(hand)
  hand_value(hand) > 21
end

def detect_result(dealer_cards, player_cards)
  player_total = hand_value(player_cards)
  dealer_total = hand_value(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

SUIT = ['Daimond', 'Heart', 'Club', 'Spade']
CARD_RANKS = ['Ace','2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King']

DECK = initialize_deck

player_hand = []
dealer_hand = []

player_total = 0
dealer_total = 0

loop do
  player_hand, dealer_hand = deal()
  display_hands(player_hand, dealer_hand)

  # player_r's turn
  loop do
    prompt "hit or stay"
    move = gets.chomp

    if move == 'hit'
      hit(player_hand)
    end

    display_hands(player_hand, dealer_hand)

    break if bust?(player_hand) or move == 'stay'
  end

  break if bust?(player_hand)

  #dealer's turn
  loop do
    #binding.pry
    if hand_value(dealer_hand) < 17
      prompt ""
      prompt "Dealer hit."
      hit(dealer_hand)
    else
      break
    end

    display_hands(player_hand, dealer_hand)

    break if bust?(dealer_hand)
  end
  break
end

player_total = hand_value(player_hand)
dealer_total = hand_value(dealer_hand)
puts "player: #{player_total}"
puts "Dealer: #{dealer_total}"
results = display_result(dealer_hand, player_hand)
