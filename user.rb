require_relative 'card'
require_relative 'hand'
class User 
  attr_reader :name, :hand
  attr_accessor :bank
  def initialize(name)
    @name = name
    @bank = 100
    @hand = Hand.new
  end
end
