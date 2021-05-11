class Card
  attr_accessor :rank, :suit, :value
  def initialize(suit, rank, value)
    @rank = rank
    @suit = suit
    @value = value
  end

  def self.give_a_card
    new_card = @@cards.sample
    @own_cards.append(new_card)
  end
end

