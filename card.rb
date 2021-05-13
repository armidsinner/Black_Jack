class Card
  SUITS = ['♠', '♣', '♥', '♦']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11]
  attr_accessor :rank, :suit, :value
  def initialize(suit, rank, value)
    @rank = rank
    @suit = suit
    @value = value
  end
end