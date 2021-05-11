require_relative 'card'
require_relative 'deck'
require_relative 'user'
require_relative 'dealer'

module Game
  attr_accessor :bank, :own_cards, :points, :cards, :game_bank, :deck, :dealer, :player
  def start_game
    self.deck = Deck.new 
    self.dealer = Dealer.new
    self.player.own_cards = []
    self.player.points = 0
    self.player.bank -= 10
    self.game_bank = 20
    for i in 0..1 
      give_a_card(player)
    end
    player.points
    for i in 0..1 
      give_a_card(dealer)
    end
    puts 'Ваши карты: '
    player.show_cards
    puts
    puts 'Ваши очки: ' + player.points. to_s
  end

  def give_a_card(user)
    needed_card = self.deck.cards.sample
    needed_card.value = 1 if  needed_card.rank == 'Ace' && user.points > 10
    user.own_cards.append(needed_card)
    user.points += needed_card.value
    self.deck.cards.delete(needed_card)
  end

  def open_cards
    print 'Карты игрока: '
    player.show_cards
    puts 
    puts 'Ваши очки: ' + player.points.to_s
    print 'Карты дилера: '
    dealer.show_cards
    puts
    puts 'Очки диллера: ' + dealer.points.to_s
    puts 'Сумма очков дилера равна ' + dealer.points.to_s
    if player.points > dealer.points && player.points < 22  || dealer.points > 21
      puts 'Победил игрок'
      player.bank += self.game_bank
    elsif player.points < dealer.points && dealer.points < 22 || player.points > 21
      puts 'Победил дилер'
    elsif player.points == dealer.points || player.points == 21 && dealer.points == 21
      puts 'Ничья'
      player.bank += self.game_bank / 2
      dealer.bank += self.game_bank / 2
    end
  end

  def dealers_turn 
    if dealer.points < 17 && dealer.own_cards.length != 3
      give_a_card(dealer) 
      puts 'Дилер берет карту'
    else
      puts 'Дилер пропускает ход'
    end
  end
end
