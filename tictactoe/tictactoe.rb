class Player
  attr_accessor :name
  def initialize(marker)
    @marker = marker
    @name = ''
  end
end

class TicTacToe

  def initialize
    @tiles = {
      'A1' => " ", 'A2' => " ", 'A3' => " ",
      'B1' => " ", 'B2' => " ", 'B3' => " ",
      'C1' => " ", 'C2' => " ", 'C3' => " "
    }
    
    @wins = [
             [@tiles['A1'], @tiles['A2'], @tiles['A3']],
             [@tiles['B1'], @tiles['B2'], @tiles['B3']],
             [@tiles['C1'], @tiles['C2'], @tiles['C3']],
             [@tiles['A1'], @tiles['B1'], @tiles['C1']],
             [@tiles['A2'], @tiles['B2'], @tiles['C2']],
             [@tiles['A3'], @tiles['B3'], @tiles['C3']],
             [@tiles['A1'], @tiles['B2'], @tiles['C3']],
             [@tiles['C1'], @tiles['B2'], @tiles['A3']]
            ]
    @player1 = Player.new('X')
    @player2 = Player.new('O')
  end
  
  def print_board
    puts "||===============||"
    puts "|| * | 1 | 2 | 3 ||"
    puts "|| A | #{@tiles['A1']} | #{@tiles['A2']} | #{@tiles['A3']} ||"
    puts "|| B | #{@tiles['B1']} | #{@tiles['B2']} | #{@tiles['B3']} ||"
    puts "|| C | #{@tiles['C1']} | #{@tiles['C2']} | #{@tiles['C3']} ||"
    puts "||===============||"
  end

  def setup_two_player
    print "Enter a name for Player 1 (You will be X): "
    name = gets.chomp
    @player1.name = name
    print "Enter a name for Player 2 (You will be O): "
    name = gets.chomp
    @player2.name = name
  end

  def game_over?
    @wins.each do |win|
      if win.all? { |tile| tile == 'X' }
        return 'X'
      elsif win.all? { |tile| tile == 'O' }
        return 'O'
      end
    end
    return nil
  end
  
  def board_full?
    @tiles.any? { |tile| tile == ' ' }
  end

  def player1_turn
    loop do 
      print "#{@player1.name}, enter an empty tile: "
      tile = gets.chomp
      if @tiles[tile] == ' '
        @tiles[tile] = 'X'
        break
      else
        puts "That tile isn't empty!"
      end
    end
  end

  def player2_turn
    loop do
      print "#{@player2.name}, enter an empty tile: "
      tile = gets.chomp
      if @tiles[tile] == ' '
        @tiles[tile] = 'O'
        break
      else
        puts "That tile isn't empty!"
      end
    end
  end

  def play!
    loop do 
      print_board
      player1_turn
      win = game_over?
      break if board_full? or not win.nil?
      print_board
      player2_turn
      win = game_over?
      break if board_full? or not win.nil?
    end
    if board_full? and win.empty?
      puts "Tie Game!"
    elsif win == 'X'
      puts "#{@player1.name} wins!"
    else
      puts "#{@player2.name} wins!"
    end
  end
    
end

game = TicTacToe.new
game.setup_two_player
game.play!
