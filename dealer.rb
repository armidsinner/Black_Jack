# frozen_string_literal: true

# Class for dealer
class Dealer < User
  def initialize(name = 'Dealer')
    super
    @bank = 0
  end
end
