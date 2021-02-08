# module Enumerable
#   def ca_each
#     return to_enum unless block_given?
#     example_array = is_a?(Array) ? self : to_a
#     position_in_array = 0 
#     while position_in_array < example_array.length
#       yield example_array[position_in_array]
#       position_in_array += 1
#     end
#       example_array
#   end
# end
# example_array = [2,3,59,99,203,202,22]
# example_array.ca_each {|number| puts number}
  def ca_each_with_index
    return to_enum unless block_given?
    example_array = is_a? (Array) ? self : to_a
    i = 0 
    while i < .length
      yield(self[i], i)
      i += 1
    end 
    self 
  end 

    #hash = hash.size
    #%w(four seven ten).ca_each_with_index {|place, index|
    #hash[place] = index 
    #}
    #hash
    #=>

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

   