class Dealer < User
  def initialize(name = 'Dealer')
    super 
    @bank = 0
  end
end
