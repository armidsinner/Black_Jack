class Hand
  attr_accessor :own_cards, :points
  def initialize 
    @own_cards = []
    @points = 0
  end

  def take_a_card(needed_card)
    self.own_cards.append(needed_card)
    needed_card.value = 1 if  needed_card.rank == 'Ace' && self.points > 10
    self.points += needed_card.value
  end
end