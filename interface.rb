# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'user'
require_relative 'dealer'

# Class for intarface
class Interface
  attr_accessor :bank, :own_cards, :points, :cards, :game_bank, :deck, :dealer, :player

  def start_game
    self.deck = Deck.new
    self.dealer = Dealer.new
    player.hand.own_cards = []
    player.hand.points = 0
    player.bank -= 10
    self.game_bank = 20
    2.times do
      player.hand.take_a_card(deck.give_a_card)
    end
    player.hand.points
    2.times do
      dealer.hand.take_a_card(deck.give_a_card)
    end
  end

  def open_cards
    print 'Карты игрока: '
    player.hand.own_cards.each { |card| print "#{card.rank}#{card.suit} " }
    puts
    puts "Ваши очки: #{player.hand.points}"
    print 'Карты дилера: '
    dealer.hand.own_cards.each { |card| print "#{card.rank}#{card.suit} " }
    puts
    puts "Очки диллера: #{dealer.hand.points}"
    winner
  end

  def winner
    if player.hand.points > dealer.hand.points &&
       player.hand.points < 22 || dealer.hand.points > 21
      puts 'Победил игрок'
      player.bank += game_bank
    elsif player.hand.points < dealer.hand.points &&
          dealer.hand.points < 22 || player.hand.points > 21
      puts 'Победил дилер'
    elsif player.hand.points == dealer.hand.points ||
          player.hand.points == 21 && dealer.hand.points == 21
      puts 'Ничья'
      player.bank += game_bank / 2
      dealer.bank += game_bank / 2
    end
  end

  def dealers_turn
    if dealer.hand.points < 17 && dealer.hand.own_cards.length != 3
      dealer.hand.take_a_card(deck.give_a_card)
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
      check_bank_start
      a = gets.chomp
      case a
      when '1'
        accept_card
      when '2'
        dealers_turn
        puts 'Ваш ход. Выберите действие
        1) Добавить карту
        2) Открыть карты'
        a = gets.chomp
        case a
        when '1'
          accept_card
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

  def check_bank_start
    if player.bank.zero?
      puts 'К сожалению, вы проиграли все ваши средства'
      abort
    end
    start_game
    print 'Ваши карты: '
    player.hand.own_cards.each { |card| print "#{card.rank}#{card.suit} " }
    puts
    puts "Ваши очки: #{player.hand.points}"
    puts 'Ваш ход. Выберите действие
    1) Добавить карту
    2) Пропустить ход
    3) Открыть карты'
  end

  def accept_card
    player.hand.take_a_card(deck.give_a_card)
    print "Получена карта #{player.hand.own_cards[-1].rank}#{player.hand.own_cards[-1].suit}"
    puts
    puts "Ваши очки: #{player.hand.points}"
    dealers_turn
    open_cards
    play_one_more
  end

  def play_one_more
    puts 'Хотите сыграть еще раз?'
    a = gets.chomp.strip
    case a
    when 'Да'
      puts "Сумма на вашем счету:#{player.bank}"
    when 'Нет'
      abort
    end
  end
end

a = Interface.new
a.start
