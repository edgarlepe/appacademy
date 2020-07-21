# frozen_string_literal: true

# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require 'prime'

def largest_prime_factor(num)
  factors = []

  (2..num).each { |i| factors << i if (num % i).zero? }

  factors.reduce do |acc, x|
    if x.prime?
      x
    else
      acc
    end
  end
end

def unique_chars?(str)
  chars = str.chars

  chars == chars.uniq
end

def dupe_indices(arr)
  char_indices = {}

  arr.each.with_index do |x, i|
    if char_indices[x]
      char_indices[x] << i
    else
      char_indices[x] = [i]
    end
  end

  char_indices.keep_if { |_, v| v.length > 1 }
end

def ana_array(arr1, arr2)
  ele_counts(arr1) == ele_counts(arr2)
end

def ele_counts(arr)
  counts = {}
  arr.each do |x|
    if counts[x]
      counts[x] += 1
    else
      counts[x] = 1
    end
  end
  counts
end
