# frozen_string_literal: true

def reverser(str, &block)
  block.call(str.reverse)
end

def word_changer(sentence, &block)
  words = sentence.split ' '
  words.map!(&block)
  words.join ' '
end

def greater_proc_value(num, proc1, proc2)
  result1 = proc1.call num
  result2 = proc2.call num

  if result1 > result2
    result1
  else
    result2
  end
end

def and_selector(array, proc1, proc2)
  array.filter { |x| proc1.call(x) && proc2.call(x) }
end

def alternating_mapper(array, proc1, proc2)
  array.map.with_index do |x, i|
    if i.even?
      proc1.call(x)
    else
      proc2.call(x)
    end
  end
end
