require_relative 'card'
class User
  attr_reader :name 
  attr_accessor :bank, :own_cards, :points
  def initialize(name)
    @name = name
    @own_cards = []
    @points = 0
    @bank = 100
  end

  def show_cards
    self.own_cards.each { |card| print card.rank.to_s  + card.suit.to_s + ' ' }
  end

  def count_points 
    self.own_cards.each do |card|
      self.points += card.value
    end
  end
end
