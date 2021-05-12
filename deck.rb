class Deck < Card
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

  def give_a_card
    new_card = @cards.sample
    @own_cards.append(new_card)
  end
end
