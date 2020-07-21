# frozen_string_literal: true

# Added methods to String class
class String
  def capitalized?
    match?(/^[A-Z][a-z]+/)
  end
end

def all_words_capitalized?(words)
  words.all?(&:capitalized?)
end

def no_valid_url?(urls)
  urls.none? do |url|
    valid_endings = %w[com net io org]
    ending = url.split('.').last
    valid_endings.include? ending
  end
end

def any_passing_students?(student_hashes)
  student_hashes.any? do |student|
    avg = student[:grades].sum / Float(student[:grades].length)
    avg >= 75
  end
end
