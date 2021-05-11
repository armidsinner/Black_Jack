require_relative 'card'
class Deck
  SUITS = ['♠', '♣', '♥', '♦']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
  attr_accessor :cards
  def initialize
    @cards = []
    create_deck
    shuffle_cards
  end

  def shuffle_cards
    @cards.shuffle!
  end 

  def create_deck 
    SUITS.each do |suit|
      RANKS.each_with_index do |rank, index|
        @cards.append(Card.new(suit, rank, VALUES[index]))
      end
    end
  end
end
