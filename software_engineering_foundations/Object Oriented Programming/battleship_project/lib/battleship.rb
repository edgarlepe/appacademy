require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new n
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "#{@board.size / 4} ships placed on board"
    @board.print
  end

  def lose?
    return false if @remaining_misses.positive?

    puts 'you lose'
    true
  end

  def win?
    return false if @board.num_ships.positive?

    puts 'you win'
    true
  end

  def game_over?
    win? || lose?
  end

  def turn
    position = @player.get_move
    successful_attack = @board.attack position
    @board.print
    @remaining_misses -= 1 unless successful_attack
    puts "#{@remaining_misses} misses remain"
  end
end
