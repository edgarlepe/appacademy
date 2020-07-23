# frozen_string_literal: true

def my_map(array, &block)
  ret = []
  array.each { |x| ret << block.call(x) }
  ret
end

def my_select(array, &block)
  ret = []

  array.each { |x| ret << x if block.call(x) }

  ret
end

def my_count(array, &block)
  count = 0

  array.each { |x| count += 1 if block.call(x) }

  count
end

def my_any?(array, &block)
  array.each { |x| return true if block.call(x) }
  false
end

def my_all?(array, &block)
  array.each { |x| return false unless block.call(x) }
  true
end

def my_none?(array, &block)
  array.each { |x| return false if block.call(x) }
  true
end
