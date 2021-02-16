module Enumerable
  def my_each
    block_given? ? size.times { |i| yield(to_a[i]) } : (return to_enum)
    self
  end

  def my_each_with_index
    block_given? ? size.times { |i| yield(to_a[i], i) } : (return to_enum)
    self
  end

  def my_select
    return to_enum unless block_given?

    array = []
    my_each { |value| array << value if yield value }
    array
  end

  def my_all?(arg = nil)
    if block_given?
      my_each { |value| return false unless yield value }
    elsif arg.is_a? Regexp
      my_each { |value| return false unless value.to_s =~ arg }
    elsif arg.is_a? Class
      my_each { |value| return false unless value.is_a? arg }
    elsif arg
      my_each { |value| return false unless value == arg }
    elsif arg.nil?
      my_each { |value| return false unless value }
    else
      my_each { |value| return false unless value }
    end
    true
  end

  def my_any?(args = nil)
    if block_given?
      my_each { |element| return true if yield(element) }
      false
    elsif arg.nil?
      my_each { |element| return true if n.nil? || element == true }
    elsif !arg.nil? && (args.is_a? Class)
      my_each { |element| return true if element.instance_of?(args) }
    elsif !arg.nil? && args.instance_of?(Regexp)
      my_each { |element| return true if arg.match(element) }
    else
      my_each { |element| return true if element == args }
    end
    false
  end

  def my_none?(arg = nil)
    if block_given?
      my_each { |value| return false if yield value }
    elsif arg.is_a? Regexp
      my_each { |value| return false if value.to_s =~ arg }
    elsif arg.is_a? Class
      my_each { |value| return false if value.is_a? arg }
    elsif arg
      my_each { |value| return false if value == arg }
    elsif arg.nil?
      my_each { |value| return false if value }
    else
      my_each { |value| return false if value }
    end
    true
  end

  def my_count(arg = nil)
    count = 0
    if block_given?
      my_each { |value| count += 1 if yield value }
    elsif arg
      my_each { |value| count += 1 if value == arg }
    else
      my_each { count += 1 }
    end
    count
  end

  def my_map(proc = nil)
    return to_enum unless block_given?

    array = []
    if proc
      my_each { |value| array.push(proc.call(value)) }
    else
      my_each { |value| array.push(yield(value)) }
    end
    array
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
end

def multiply_els(arr)
  arr.my_inject(:*)
end

example_array = [2, 3, 59, 99, 203, 202, 22]

p example_array.each { |number| number }
p example_array.my_each { |number| number }

p example_array.each_with_index { |_number, index| p index }
p example_array.my_each_with_index { |_number, index| p index }

p example_array.select { |number| number > 100 } # [202, 203]
p example_array.my_select { |number| number > 100 } # [202, 203]

p example_array.all? { |number| number > 1 } # true
p example_array.my_all? { |number| number > 1 } # true

p example_array.any? { |number| number % 3 == 0 } # true
p example_array.my_any? { |number| number % 3 == 0 } # true

p example_array.none? { |number| number > 203 } # true
p example_array.my_none? { |number| number > 203 } # true

p example_array.count { |number| number % 3 == 0 } # 2
p example_array.my_count { |number| number % 3 == 0 } # 2

p example_array.map { |number| number * 2 } # [4, 6, 118...]
p example_array.my_map { |number| number * 2 } # [4, 6, 118...]

p example_array.inject(:*) # 31616118072
p example_array.my_inject(:*) # 31616118072

p multiply_els(example_array) # 31616118072
