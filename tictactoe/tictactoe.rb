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
      1 => 1, 2 => 2, 3 => 3,
      4 => 4, 5 => 5, 6 => 6,
      7 => 7, 8 => 8, 9 => 9
    }
    
    @wins = [
             [@tiles[1], @tiles[2], @tiles[3]],
             [@tiles[4], @tiles[5], @tiles[6]],
             [@tiles[7], @tiles[8], @tiles[9]],
             [@tiles[1], @tiles[4], @tiles[7]],
             [@tiles[2], @tiles[5], @tiles[8]],
             [@tiles[3], @tiles[6], @tiles[9]],
             [@tiles[1], @tiles[5], @tiles[9]],
             [@tiles[7], @tiles[5], @tiles[3]]
            ]

    @player1 = Player.new('X')
    @player2 = Player.new('O')
  end
  
  def print_board
    puts " #{@tiles[1]} | #{@tiles[2]} | #{@tiles[3]}"
    puts " #{@tiles[4]} | #{@tiles[5]} | #{@tiles[6]}"
    puts " #{@tiles[7]} | #{@tiles[8]} | #{@tiles[9]}"
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
      if win.all? { |tile| @tiles[tile] == 'X' }
        return 'X'
      elsif win.all? { |tile| @tiles[tile] == 'O' }
        return 'O'
      end
    end
    return ''
  end
  
  def board_full?
    @tiles.values.all? { |tile| tile.is_a? String }
  end

  def player1_turn
    loop do 
      print "#{@player1.name}, enter an empty tile: "
      tile = gets.chomp.to_i
      if @tiles[tile].is_a? Integer and tile > 0 and tile < 10
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
      tile = gets.chomp.to_i
      if @tiles[tile].is_a? Integer and tile > 0 and tile < 10
        @tiles[tile] = 'O'
        break
      else
        puts "That tile isn't empty!"
      end
    end
  end

  def play!
    win = ''
    loop do 
      print_board
      player1_turn
      win = game_over?
      break if board_full? or not win.empty?
      print_board
      player2_turn
      win = game_over?
      break if board_full? or not win.empty?
    end
    print_board
    if board_full? and win.empty?
      puts "Tie Game!"
    elsif win == 'X' 
      puts "#{@player1.name} wins!"
    elsif win == 'O'
      puts "#{@player2.name} wins!"
    end
  end
    
end

game = TicTacToe.new
game.setup_two_player
game.play!


#### Notes
# Make it so that you have one turn method and pass in a player object
# Clean up the play method
# Add a way to play against CPU?
