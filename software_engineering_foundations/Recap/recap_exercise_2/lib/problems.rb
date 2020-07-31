# frozen_string_literal: true

require 'prime'

class String
  def bigrams
    words = split
    arr = []
    words.each do |word|
      (0..1).each do |i|
        arr += __take_2(word[i..].length / 2, word[i..])
      end
    end
    arr.uniq
  end

  private

  def __take_2(n, str)
    return [] if n.zero?

    [str.chars.take(2).join] + __take_2(n - 1, str.chars.drop(2).join)
  end
end

# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num1, num2)
  prime_factorization = lcm_prime_factorization(num1, num2)
  prime_factorization.reduce(1) { |acc, pair| acc * (pair[0]**pair[1]) }
end

def lcm_prime_factorization(num1, num2)
  prime_factorization_union = Prime.prime_division(num1).union(Prime.prime_division(num2)).sort!
  prime_factorization_union.reject! do |pair|
    same_prime_index = prime_factorization_union.rindex { |x| x[0] == pair[0] }
    same_prime_index && prime_factorization_union[same_prime_index][1] > pair[1]
  end
  prime_factorization_union
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bigrams = str.bigrams
  most_freq_with_count = bigrams.reduce(['', 0]) do |acc, bigram|
    count = str.scan(/#{bigram}/).length
    acc[1] > count ? acc : [bigram, count]
  end
  most_freq_with_count[0]
end

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    new_hash = {}
    each_pair { |k, v| new_hash[v] = k }
    new_hash
  end
end

class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    count = 0
    (0...length - 1).each do |i|
      self[i + 1..].each { |x| count += 1 if self[i] + x == num }
    end
    count
  end

  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
  # two parameters, which represents the two elements in the array being compared.
  # If the block returns 1, it means that the second element passed to the block
  # should go before the first (i.e. switch the elements). If the block returns -1,
  # it means the first element passed to the block should go before the second
  # (i.e. do not switch them). If the block returns 0 it implies that
  # it does not matter which element goes first (i.e. do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    prc ||= proc { |a, b| a <=> b }
    sort!(&prc)
  end
end
