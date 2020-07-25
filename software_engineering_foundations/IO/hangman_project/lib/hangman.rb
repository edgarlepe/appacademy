# frozen_string_literal: true

# Model for Hangman Game
class Hangman
  DICTIONARY = %w[cat dog bootcamp pizza]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new @secret_word.length, '_'
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def self.random_word
    DICTIONARY.sample
  end

  def already_attempted?(char)
    @attempted_chars.include? char
  end

  def get_matching_indices(char)
    matching_indices = []

    @secret_word.chars.each.with_index do |c, i|
      matching_indices << i if char == c
    end

    matching_indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
    @guess_word
  end

  def try_guess(char)
    if already_attempted? char
      puts 'that has already been attempted'
      false
    else
      matching_indices = get_matching_indices(char)
      @attempted_chars << char
      if matching_indices.length.positive?
        fill_indices char, matching_indices
      else
        @remaining_incorrect_guesses -= 1
      end
      true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    user_char = gets.chomp
    try_guess user_char
  end

  def win?
    if @guess_word.join == @secret_word
      puts 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses.zero?
      puts 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      true
    else
      false
    end
  end
end
