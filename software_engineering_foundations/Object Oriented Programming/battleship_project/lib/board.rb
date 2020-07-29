# frozen_string_literal: true

# Board model
class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new n, :N }
    @size = n**2
  end

  def [](indices)
    @grid[indices[0]][indices[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.flatten.count :S
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts 'you sunk my battleship!'
      true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    dim = Integer.sqrt(size)
    quarter = size / 4
    positions = []

    until positions.length == quarter && positions.uniq!.nil?
      positions << rand(0...size)
    end

    positions.each do |pos|
      position = [(pos / dim), (pos % dim)]
      self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map { |row| row.map { |val| val == :S ? :N : val } }
  end

  def self.print_grid(grid)
    grid.each { |row| puts row.join(' ') }
  end

  def cheat
    Board.print_grid @grid
  end

  def print
    Board.print_grid hidden_ships_grid
  end
end
