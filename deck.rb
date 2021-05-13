class Deck
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
    Card::SUITS.each do |suit|
      Card::RANKS.each_with_index do |rank, index|
        @cards.append(Card.new(suit, rank, Card::VALUES[index]))
      end
    end
  end

  def give_a_card
    needed_card = self.cards.sample
    self.cards.delete(needed_card)
  end

end
