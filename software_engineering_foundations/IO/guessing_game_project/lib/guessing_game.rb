class GuessingGame
  attr_reader :num_attempts

  def initialize(min, max)
    prng = Random.new
    @secret_num = prng.rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1

    if num == @secret_num
      @game_over = true
      puts 'you win'
    elsif num > @secret_num
      puts 'too big'
    else
      puts 'too small'
    end
  end

  def ask_user
    puts 'enter a number'
    user_num = gets.chomp.to_i
    check_num user_num
  end
end
