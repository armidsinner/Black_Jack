class Hand
  attr_accessor :own_cards, :points
  def initialize 
    @own_cards = []
    @points = 0
  end

  def show_cards
    self.own_cards.each { |card| print card.rank.to_s + card.suit.to_s + ' ' }
  end

  def count_points 
    self.own_cards.each do |card|
      self.points += card.value
    end
  end
end