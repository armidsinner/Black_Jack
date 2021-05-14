# frozen_string_literal: true

# Class for a card
class Card
  SUITS = ['♠', '♣', '♥', '♦'].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].freeze
  attr_accessor :rank, :suit, :value

  def initialize(suit, rank, value)
    @rank = rank
    @suit = suit
    @value = value
  end
end
