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
end
