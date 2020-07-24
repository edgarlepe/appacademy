# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if empty?

    max - min if all? { |x| x.is_a? Numeric }
  end

  def average
    if empty?
      nil
    elsif all? { |x| x.is_a? Numeric }
      Float(sum) / length
    end
  end

  def median
    return nil if empty?

    half = length / 2

    if length.even?
      sort[half - 1, 2].sum / 2.0
    else
      sort[half]
    end
  end

  def counts
    ret = {}

    each do |x|
      if ret[x]
        ret[x] += 1
      else
        ret[x] = 1
      end
    end

    ret
  end

  def my_count(val)
    n = 0
    each { |x| n += 1 if x == val }
    n
  end

  def my_index(val)
    each.with_index { |x, i| return i if x == val }
    nil
  end

  def my_uniq
    is_unique = Hash.new { |hash, key| hash[key] = true }

    filter { |x| is_unique[x] ^ is_unique[x] = false }
  end

  def my_transpose
    n_col = self[0].length
    new_arr = Array.new(n_col) { [] }

    (0...n_col).each do |i|
      (0...length).each do |j|
        new_arr[i][j] = self[j][i]
      end
    end

    new_arr
  end
end
