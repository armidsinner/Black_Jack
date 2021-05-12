require_relative 'card'
require_relative 'deck'
require_relative 'user'
require_relative 'dealer'

class Interface
  attr_accessor :bank, :own_cards, :points, :cards, :game_bank, :deck, :dealer, :player
  def start_game
    self.deck = Deck.new 
    self.dealer = Dealer.new
    self.player.hand.own_cards = []
    self.player.hand.points = 0
    self.player.bank -= 10
    self.game_bank = 20
    for i in 0..1 
      give_a_card(player)
    end
    player.hand.points
    for i in 0..1 
      give_a_card(dealer)
    end
  end

  def give_a_card(user)
    needed_card = self.deck.cards.sample
    needed_card.value = 1 if  needed_card.rank == 'Ace' && user.hand.points > 10
    user.hand.own_cards.append(needed_card)
    user.hand.points += needed_card.value
    self.deck.cards.delete(needed_card)
  end

  def open_cards
    print 'Карты игрока: '
    player.hand.own_cards.each { |card| print card.rank.to_s + card.suit.to_s + ' ' }
    puts
    puts 'Ваши очки: ' + player.hand.points.to_s
    print 'Карты дилера: '
    dealer.hand.own_cards.each { |card| print card.rank.to_s + card.suit.to_s + ' ' }
    puts
    puts 'Очки диллера: ' + dealer.hand.points.to_s
    puts 'Сумма очков дилера равна ' + dealer.hand.points.to_s
    if player.hand.points > dealer.hand.points && player.hand.points < 22  || dealer.hand.points > 21
      puts 'Победил игрок'
      player.bank += self.game_bank
    elsif player.hand.points < dealer.hand.points && dealer.hand.points < 22 || player.hand.points > 21
      puts 'Победил дилер'
    elsif player.hand.points == dealer.hand.points || player.hand.points == 21 && dealer.hand.points == 21
      puts 'Ничья'
      player.bank += self.game_bank / 2
      dealer.bank += self.game_bank / 2
    end
  end

  def dealers_turn
    if dealer.hand.points < 17 && dealer.hand.own_cards.length != 3
      give_a_card(dealer)
      puts 'Дилер берет карту'
    else
      puts 'Дилер пропускает ход'
    end
  end

  def start
    puts 'Добро пожаловать! Введите имя игрока'
    name = gets.chomp
    self.player = User.new(name)
    while TRUE
      if self.player.bank == 0
        puts 'К сожалению, вы проиграли все ваши средства'
        break
      end
      start_game
      print 'Ваши карты: '
      player.hand.own_cards.each { |card| print card.rank.to_s + card.suit.to_s + ' ' }
      puts
      puts 'Ваши очки: ' + player.hand.points. to_s
      puts 'Ваш ход. Выберите действие
      1) Добавить карту
      2) Пропустить ход
      3) Открыть карты'
      a = gets.chomp
      case a
      when '1'
        first_turn
      when '2'
        dealers_turn
        puts 'Ваш ход. Выберите действие
        1) Добавить карту
        2) Открыть карты'
        a = gets.chomp
        case a 
        when '1'
          first_turn
        when '2'
          open_cards
          play_one_more
        end
      when '3'
        open_cards
        play_one_more
      end
    end
  end

  def first_turn
    give_a_card(player)
    print 'Получена карта ' + player.hand.own_cards[-1].rank.to_s + player.hand.own_cards[-1].suit.to_s
    puts
    puts 'Ваши очки: ' + player.hand.points.to_s
    dealers_turn
    open_cards
    play_one_more
  end

  def play_one_more
    puts 'Хотите сыграть еще раз?'
    a = gets.chomp.strip
    case a
    when 'Да'
      puts 'Сумма на вашем счету:' + player.bank.to_s
    when 'Нет'
      abort
    end
  end
end

a = Interface.new
a.start