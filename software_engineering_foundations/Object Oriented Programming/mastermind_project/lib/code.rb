require 'pry'

class Code
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }.freeze

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.member? char.upcase }
  end

  def initialize(chars)
    raise 'Invalid peg' unless Code.valid_pegs?(chars)

    @pegs = chars.map(&:upcase)
  end

  def self.random(len)
    random_pegs = []
    len.times { random_pegs << POSSIBLE_PEGS.keys[rand(0..3)] }
    Code.new random_pegs
  end

  def self.from_string(pegs_string)
    Code.new pegs_string.chars
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    min_length = guess.length < length ? guess.length : length
    count = 0
    (0...min_length).each { |i| count += 1 if guess[i] == @pegs[i] }
    count
  end

  def num_near_matches(guess)
    count = 0
    POSSIBLE_PEGS.keys.each do |key|
      self_count = @pegs.count(key)
      guess_count = guess.pegs.count(key)
      exact_matches_for_key = num_exact_matches_for_key(key, guess)
      count += [self_count, guess_count - exact_matches_for_key].min
    end
    count
  end

  def ==(other)
    false if length != other.length

    pegs == other.pegs
  end

  private

  def num_exact_matches_for_key(key, guess)
    min_length = guess.length < length ? guess.length : length
    count = 0
    (0...min_length).each do |i|
      count += 1 if @pegs[i] == key && guess[i] == @pegs[i]
    end
    count
  end
end
