module Enumerable
  def my_each
    return to_enum unless block_given?
     example_array = is_a?(Array) ? self : to_a
     position_in_array = 0 
      while position_in_array < example_array.length
        yield example_array[position_in_array]
        position_in_array += 1
      end
       example_array
   end
  end
  example_array = [2,3,59,99,203,202,22]
  example_array.my_each {|number| puts number}

  def my_each_with_index
    return to_enum unless block_given?
    example_array = is_a? (Array) ? self : to_a
    i = 0 
    while i < .length
      yield(self[i], i)
      i += 1
    end 
    self 
    end 
  end
  def my_select
    return to_enum(:my_select) unless block_given?

    new_arr = []
    my_each { |element| new_arr << element if yield(element) }
    new_arr
  end
  def my_all?(*args)
    if !args[0].nil?
      my_each { |element| return false unless args[0] === element }
    elsif block_given?
      my_each { |element| return false unless yield(element) }
    else
      my_each { |element| return false unless element }
    end
    true
  end
  def my_any?(*args)
    if !args[0].nil?
      my_each { |element| return true if args[0] === element }
    elsif block_given?
      my_each { |element| return true if yield(element) }
    else
      my_each { |element| return true if element }
    end
    false
  end
  def my_none?(args = nil, &block)
    !my_any?(args, &block)
  end
  def my_count (arg = nil)
    c = 0  
    if block_given?
      my_each { |x| c +=1 if yield(x) }
      elsif !block && arg.nil?
        c = length
      else c = my_select { |x| x == arg }. length
      end
      c
    end
  end
  def my_map (proc = nil)
    return to_enum(:my_map) unless block_given? || !proc.nil?

    arr = [3,4,33,62]
    if proc.nil?
      my_each do {|val| arr << proc.call(val)}
      else
        my_each {|val| arr << yield(val)}
      end
     arr 
    end
  end
  def my_inject(*arg)
    arg[0].is_a?(Integer) ? initial = arg[0] : symbol = arg[0]
    if initial && !arg[1].is_a?(Integer)
      symbol = arg[1]
    elsif arg.nil?
      initial = self[0]
    end
    result = initial
    if symbol
      my_each { |value| result = result ? result.send(symbol, value) : value }
    else
      my_each { |value| result = result ? yield(result, value) : value }
    end
    result
  end
  def multiply_els(arr)
  arr.my_inject(:*)
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Style/CaseEquality
