# frozen_string_literal: true

def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(dog_hashes)
  dog_hashes.reject { |dog_hash| dog_hash['age'] <= 2 }
end

def count_positive_subarrays(two_d_arr)
  two_d_arr.count { |arr| arr.sum.positive? }
end

def aba_translate(word)
  vowels = 'aeiou'
  chars = word.chars

  chars.reduce([]) do |acc, char|
    if vowels.include? char
      acc << char << 'b' << char
    else
      acc << char
    end
  end.join
end

def aba_array(words)
  words.map { |word| aba_translate(word) }
end
