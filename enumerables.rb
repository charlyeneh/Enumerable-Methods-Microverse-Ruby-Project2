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

  def my_all?(_arg = nil)
    if block_given?
      my_each { |value| return false unless yield value }
    else
      my_each { |value| return false unless value }
    end
    true
  end

  def my_any?(_arg = nil)
    if block_given?
      my_each { |value| return true if yield value }
    else
      my_each { |value| return true if value }
    end
    false
  end

  def my_none?(_arg = nil)
    if block_given?
      my_each { |value| return false if yield value }
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

  def my_inject(memo = nil)
    each { |x| memo = memo.nil? ? x : yield(memo, x) }
    memo
  end
end

def multiply_els(array)
  array.my_inject { |acc, number| acc * number }
end
