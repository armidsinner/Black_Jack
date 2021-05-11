require_relative 'modules'

class Interface
  include Game
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
      puts 'Ваш ход. Выберите действие
      1) Добавить карту
      2) Пропустить ход
      3) Открыть карты'
      a = gets.chomp
      case a
      when '1'
        give_a_card(player)
        print 'Получена карта ' + player.own_cards[-1].rank.to_s + player.own_cards[-1].suit.to_s
        puts
        puts 'Ваши очки: ' + player.points.to_s
        dealers_turn
        open_cards 
        puts 'Хотите сыграть еще раз?'
        a = gets.chomp.strip
        case a 
        when 'Да'
          puts 'Сумма на вашем счету:' + player.bank.to_s
        when 'Нет'
          FALSE
        end 
      when '2'
        dealers_turn
        puts 'Ваш ход. Выберите действие
        1) Добавить карту
        2) Открыть карты'
        a = gets.chomp
        case a 
        when '1'
          give_a_card(player)
          print 'Получена карта ' + player.own_cards[-1].rank.to_s + player.own_cards[-1].suit.to_s
          puts
          puts 'Ваши очки: ' + player.points.to_s
          dealers_turn
          open_cards 
          puts 'Хотите сыграть еще раз?'
          a = gets.chomp.strip
          case a 
          when 'Да'
            puts player.bank
          when 'Нет'
            FALSE
          end 
          when '2'
          open_cards 
          puts 'Хотите сыграть еще раз?'
          a = gets.chomp.strip
          case a 
          when 'Да'
            puts 'Сумма на вашем счету:' + player.bank.to_s
          when 'Нет'
            break
          end 
        end
      when '3'
        open_cards
        puts 'Хотите сыграть еще раз?'
        a = gets.chomp.strip
        case a 
        when 'Да'
          puts 'Сумма на вашем счету:' + player.bank.to_s
        when 'Нет'
          break
        end
      end
    end
  end
end

a = Interface.new
a.start