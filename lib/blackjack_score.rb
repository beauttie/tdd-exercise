# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  if hand.length > 5
    raise ArgumentError.new("Too many cards in your hand.")
  end

  score = 0
  ace_count = 0

  hand.each do |card|
    if ! VALID_CARDS.include?(card)
      raise ArgumentError.new("Invalid card in your hand.")
    end

    if card == "Jack" || card == "Queen" || card == "King"
      score += 10
    elsif card == "Ace"
      ace_count += 1
    else
      score += card
    end
  end

  case ace_count
  when 1, 2, 3, 4, 5
    if score + 11 <= 21 - (ace_count - 1)
      # Cannot have more than one ace with value of 11
      score += 11 + (ace_count - 1)
    else
      score += ace_count
    end
  end

  if score > 21
    raise ArgumentError.new("BUST! You lose.")
  end

  return score
end
